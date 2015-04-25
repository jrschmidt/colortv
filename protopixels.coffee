# PROTOPIXELS - COLOR TV APP
# by JR Schmidt 2015

# WHAT THIS DOES: This application takes the pixels from a small image (50x50)
# and converts them to a format that emulates a CRT screen from an old color TV.
# Instead of pixels as we usually think of them, these screens had separate red,
# green and blue dots mixed together in a triangular pattern (look at the screen
# of an old color TV through a magnifying glass if you get a chance). Additionally,
# instead of going across horizontally in a straight line, the dots go slightly
# downward as they go across the screen. So there is no one to one correspondence
# between the original pixels and the dots. Each dot is rendered as a circle 7
# pixels in diameter, and each pixel in the original small image is enlarged
# to a square covering 12 pixels to a side.

# HOW IT WORKS: For each red, blue or green dot, the application computes the
# relative contribution from each of the 12x12 enlarged pixel squares that
# intersect the dot's area of influence. Then, for each of those pixel squares,
# the app takes that square's color value for the color of that dot (red, green
# or blue), multiplies it by the ratio for that square, and adds it to the color
# value for the dot. So if a pixel square covered 40% of a dot, and the pixel's
# color value for that color was 50%, then the app would add 0.20 x 255 = 51 to
# the dot's color value. Then each pixel of the 7x7 pixel dot would be rendered
# with the resulting value.


# CONVENTIONS:

# "pixel square" - A square with dimensions 12 pixels by 12 pixels, representing
# one pixel on the original small image.

# "hex zone" - The skewed hexagonal shape denoting a dot's area of influence,
# which can be formed for a dot of a given color by joining the midpoints of
# the six surrounding dots of the other two colors.

# xx,yy  -  Coordinates of a pixel in the original small image, which are also
# the coordinates of a large 12x12 square superimposed on the large image grid.

# x,y  -  Pixel coordinates on the large image. x = 12 * xx, and y = 12 * yy.

# a,b  -  Coordinates of a big "dot" on the dot system.

# Dot coordinates: A blue dot, 7 pixels in diameter, is set snugly in the upper
# left corner and labeled '1,16' for column 1, row 16. To the right is a green dot,
# labeled '3,16'. To the right of the green dot is a red dot, '5,16', followed
# by another blue dot at '7,16'. Each succeeding dot in this row is centered one
# pixel lower than the dot to its left.
#
# Between the green dot '3,16' and red dot '5,16' there is a blue dot above labeled
# '4,15' and a blue dot below labeled '4,17'. This way, all the dots in column
# 3 are green, the dots in column 4 are blue, and column 5 is red.
#
# Since the rows are skewed slightly downward as they go from left to right, if we
# start with row 16 in the upper left corner, then dots from row 0 will appear in
# the upper right corner, if we have a 50x50 original image expanded to 600x600.


window.onload = ->
  original = new Image()
  original.onload = =>
    colortv = new ColorTvApp
    colortv.repixelize(original)
  original.src = 'orig.png'



class ColorTvApp

  constructor: ->
    @dots = new DotDraw
    @iterator = new DotIterator

  repixelize: (original) ->
    bigdata = @convert(original)
    @display(bigdata)


  convert: (img) ->
    orig = document.createElement("canvas")
    octx = orig.getContext('2d')
    octx.drawImage(img,0,0)

    imgdata = octx.getImageData(0,0,50,50)
    ht = imgdata.height
    wd = imgdata.width
    idata = imgdata.data

    big = document.getElementById('big')
    bigctx = big.getContext('2d')
    bigimgdata = bigctx.createImageData(600,600)
    grid = bigimgdata.data

    for a in [0..185]
      span = @iterator.get_span(a)
      for b in [span[0]..span[1]] by 2
        @dots.build_dot(grid,a,b)

    return bigimgdata


  display: (pxdata) ->
    big = document.getElementById('big')
    bigctx = big.getContext('2d')
    bigctx.putImageData(pxdata,0,0)



class DotDraw

  constructor: ->
    @dot_helper = new DotHelper
    @shape = [1,2,3,3,3,2,1]


  build_dot:(grid,a,b) ->
    switch a%3
      when 0
        rgb = [0,255,0]
      when 1
        rgb = [0,0,255]
      when 2
        rgb = [255,0,0]
    @draw_dot(grid,a,b,rgb)


  draw_dot: (grid,a,b,rgb) ->
    rgb.push(255)
    dots = @get_pixels(a,b)
    @draw_pixel(grid,px,rgb) for px in dots


  draw_pixel: (grid,px,rgba) ->
    ix = 2400*px[1] + 4*px[0]
    for i in [0..3]
      grid[ix + i] = rgba[i]



  get_pixels: (a,b) ->
    pxx = []
    cxy = @dot_helper.get_xy(a,b)
    cx = cxy[0]
    cy = cxy[1]
    for k in [0..6]
      y = cy + k - 3
      for x in [ cx - @shape[k] .. cx + @shape[k] ]
        pxx.push([x,y]) if x >= 0 and x < 600 and y >= 0 and y < 600
    return pxx



class DotIterator

  get_span: (col) ->
    if col in [0..169] # Columns that start at the top of the grid
      if col%2 == 0
        top = 15 - 2 * Math.floor(col/22)
      else
        top = 16 - 2 * Math.floor((col + 11)/22)
    if col in [170..185] # Columns that start along the right side of the grid
      top = 1 + 7 * (col - 170)

    if col in [0..14] # Columns that end along the left side of the grid
      bottom = 7 * (col + 3)
    if col in [15..185] # Columns that end at the bottom of the grid
      if col%2 == 0
        bottom = 123 - 2 * Math.floor((col - 2)/22)
      else
        bottom = 122 - 2 * Math.floor((col - 13)/22)

    return [top,bottom]



class DotSquareHelper

  constructor: ->
    @dot_helper = new DotHelper

  find_squares: (a,b) ->
    dot_xy = @dot_helper.get_xy(a,b)
    xy12 = @get_xxyy(dot_xy[0], dot_xy[1])
    dot_xxyy = xy12.xxyy
    dot_dxy = xy12.dxy

    if dot_dxy[0] < 6
      qdx = 5 - dot_dxy[0]
    else
      qdx = 17 - dot_dxy[0]

    if dot_dxy[1] < 6
      qdy = 5 - dot_dxy[1]
    else
      qdy = 17 - dot_dxy[1]

    if dot_dxy[0] < 6
      if dot_dxy[1] < 6
        # dot center is in quadrant 'd'
        adjust = [ [-1,-1], [0,-1], [-1,0], [0,0] ]
      else
        # dot center is in quadrant 'b'
        adjust = [ [-1,0], [0,0], [-1,1], [0,1] ]
    else
      if dot_dxy[1] < 6
        # dot center is in quadrant 'c'
        adjust = [ [0,-1], [1,-1], [0,0], [1,0] ]
      else
        # dot center is in quadrant 'a'
        adjust = [ [0,0], [1,0], [0,1], [1,1] ]

    sq = []
    for ad in adjust
      sqx = dot_xxyy[0] + ad[0]
      sqy = dot_xxyy[1] + ad[1]
      sq.push([sqx,sqy])

    quad_xxyy = sq[0]

    for k in [0..3]
      if sq[k][0] < 0 or sq[k][0] > 49 or sq[k][1] < 0 or sq[k][1] > 49
        sq[k] = null

    sqq = {
      xxyy: quad_xxyy
      dxy: [qdx,qdy]
      squares: sq
    }
    return sqq


  get_xxyy: (x,y) ->
    xx = Math.floor(x/12)
    yy = Math.floor(y/12)
    dx = x%12
    dy = y%12
    return {xxyy: [xx,yy], dxy: [dx,dy]}



class DotHelper

  get_xy: (a,b) ->
    if a%2 == 0
      return @even_xy(a,b)
    else
      return @odd_xy(a,b)


  even_xy: (a,b) ->
    od  = @odd_xy(a-1, b-1)
    x = od[0] + 3
    y = od[1] + 6
    return [x,y]


  odd_xy: (a,b) ->
    x = 7.5 + 3.5*a - 0.5*b    # x = 3 + 7*((a-1)/2) - (b-16)/2
    y = 0.5*a + 5.5*b - 85.5   # y = 3 + 11*(b-16)/2 + (a-1)/2
    return [x,y]



class QuadrantSplitter

  constructor: ->
    @up = [3,4,5,7,7,6,6,6,6,5,5,3,2]
    @dn =[1,2,4,4,5,5,5,5,6,6,4,3,2]


  ratios: (hx,hy) ->
    spl = @split(hx,hy)
    rr = []
    rr.push(q/117) for q in spl
    return rr


  split: (hx,hy) ->
    top = @up.slice(0)
    btm = @dn.slice(0)

    if hy < 6
      up_trim = 6 - hy
    else
      up_trim = 0
    if hy > 6
      dn_trim = hy - 6
    else
      dn_trim = 0

    if hy < 6
      for j in [0..12]
        cut = Math.min(top[j], up_trim)
        top[j] = top[j] - cut
        btm[j] = btm[j] + cut

    if hy > 6
      for j in [0..12]
        cut = Math.min(btm[j], dn_trim)
        btm[j] = btm[j] - cut
        top[j] = top[j] + cut

    qa = 0 # Quadrant 'a' upper-left
    qb = 0 # Quadrant 'b' upper-right
    qc = 0 # Quadrant 'c' lower-left
    qd = 0 # Quadrant 'd' lower-right

    for j in [0..hx]
      qa += top[j]
      qc += btm[j]

    for j in [hx+1..12]
      qb += top[j]
      qd += btm[j]

    return [qa,qb,qc,qd]
