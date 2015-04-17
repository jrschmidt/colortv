window.onload = ->
  original = new Image()
  original.onload = =>
    bigdata = convert(original)
    display(bigdata)
  original.src = 'orig.png'



class SquareDotHelper

  constructor: ->

    # z_blue = [
    #   {zmax: , zcol: }
    #
    # z_red = [
    #   {zmax: , zcol: }

    z_green = [
      {zmax: 114, zcol: 3}
      {zmax: 99, zcol: 6}
      {zmax: 84, zcol: 9}
      {zmax: 69, zcol: 12}
      {zmax: 54, zcol: 15}
      {zmax: 39, zcol: 18}
      {zmax: 24, zcol: 21}
      {zmax: 9, zcol: 24}
      {zmax: 111, zcol: 30}
      {zmax: 96, zcol: 33}
      {zmax: 81, zcol: 36}
      {zmax: 66, zcol: 39}
      {zmax: 51, zcol: 42}
      {zmax: 36, zcol: 45}
      {zmax: 21, zcol: 48}
      {zmax: 6, zcol: 51}
      {zmax: 108, zcol: 57}
      {zmax: 93, zcol: 60}
      {zmax: 78, zcol: 63}
      {zmax: 63, zcol: 66}
      {zmax: 48, zcol: 69}
      {zmax: 33, zcol: 72}
      {zmax: 18, zcol: 75}
      {zmax: 3, zcol: 78}
      {zmax: 105, zcol: 84}
      {zmax: 90, zcol: 87}
      {zmax: 75, zcol: 90}
      {zmax: 60, zcol: 93}
      {zmax: 45, zcol: 96}
      {zmax: 30, zcol: 99}
      {zmax: 15, zcol: 102}
      {zmax: 0, zcol: 105}
      {zmax: 102, zcol: 111}
      {zmax: 87, zcol: 114}
      {zmax: 72, zcol: 117}
      {zmax: 57, zcol: 120}
      {zmax: 42, zcol: 123}
      {zmax: 27, zcol: 126}
      {zmax: 12, zcol: 129}
      {zmax: 114, zcol: 135}
      {zmax: 99, zcol: 138}
      {zmax: 84, zcol: 141}
      {zmax: 69, zcol: 144}
      {zmax: 54, zcol: 147}
      {zmax: 39, zcol: 150}
      {zmax: 24, zcol: 153}
      {zmax: 9, zcol: 156}
      {zmax: 111, zcol: 162}
      {zmax: 96, zcol: 165}
      {zmax: 81, zcol: 168}
    ]


  get_dots: (xx,yy) ->
    # fake answer:
    return {b: [1,16],r: [2,17], g: [3,16]}


  get_dot_column: (color, xx, yy) ->
    # fake answer:
    return 1






convert = (img) ->
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

  for n in [0..49]
    for m in [0..49]
      r = idata[200*n + 4*m]
      g = idata[200*n + 4*m + 1]
      b = idata[200*n + 4*m + 2]
      insert(grid, m, n, r, g, b)

  return bigimgdata


insert = (gr, mm, nn, rr, gg, bb) ->
  dots = [
    [6,0,6]
    [6,0,6]
    [6,0,6]
    [6,0,6]
    [6,0,6]
    [5,2,5]
    [4,4,4]
    [3,6,3]
    [3,6,3]
    [2,8,2]
    [1,10,1]
    [0,12,0]
  ]

  rrr = [rr,0,0,255]
  ggg = [0,gg,0,255]
  bbb = [0,0,bb,255]
  rgb = [rrr,bbb,ggg]
  zz = 28800*nn + 48*mm

  for k in [0..11]
    j2 = 0
    j3 = 0
    for cc in [0..2]
      if dots[k][cc] > 0
        for j in [j2 .. j2 + dots[k][cc] - 1]
          putpx(gr,rgb[cc],zz,k,j)
          j3 = j
        j2 = j3 + 1


putpx = (gggg, rgba, zzzz, kkkk, jjjj) ->
  ix = zzzz + 2400*kkkk + 4*jjjj
  for ii in [0..3]
    gggg[ix+ii] = rgba[ii]


display = (pxdata) ->
  big = document.getElementById('big')
  bigctx = big.getContext('2d')
  bigctx.putImageData(pxdata,0,0)
