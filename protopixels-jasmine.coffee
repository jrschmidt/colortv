# window.onload = ->
#   original = new Image()
#   original.onload = =>
#     bigdata = convert(original)
#     display(bigdata)
#   original.src = 'orig.png'



class SquareDotHelper

  get_dot_col: (xx,yy) ->
    return 10



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
