window.onload = ->

  original = new Image()
  original.onload = =>
    big = convert(original)
    display(big)
  original.src = 'orig.png'


convert = (img) ->
  orig = document.createElement("canvas")
  octx = orig.getContext('2d')
  octx.drawImage(img,0,0)

  imgdata = octx.getImageData(0,0,50,50)
  ht = imgdata.height
  wd = imgdata.width
  idata = imgdata.data

  blank = document.createElement("canvas")
  bctx = blank.getContext('2d')
  grid = bctx.createImageData(600,600)

  for m in [0..49]
    for n in [0..49]
      r = idata[200*n + 4*m]
      g = idata[200*n + 4*m + 1]
      b = idata[200*n + 4*m + 2]
      insert(grid, m, n, r, g, b)

  return grid


insert = (gr, mm, nn, rr, gg, bb) ->
  dots = [6,6,6,6,6,5,4,3,3,2,1,0]
  rrr = [rr,0,0,255]
  ggg = [0,gg,0,255]
  bbb = [0,0,bb,255]
  zz = 28800*nn + 48*mm
  for k in [0..11]
    for j in [0..11]
      p = dots[k]
      p2 = 2*(6-p)
      for i in [0..p]
        putpx(gr,rrr,zz,k,j,i)
      for i in [0..p2]
        putpx(gr,bbb,zz,k,j,i)
      for i in [0..p]
        putpx(gr,ggg,zz,k,j,i)


putpx = (gggg, rgba, zzzz, kkkk, jjjj, iiii) ->
  console.log " "
  console.log "zz = #{zzzz}"
  console.log "k = #{kkkk}"
  console.log "j = #{jjjj}"
  console.log "i = #{iiii}"
  for ii in [0..4]
    console.log "  ... add:  #{rgba[ii]}"
  alert "next"


display = (pxdata) ->
