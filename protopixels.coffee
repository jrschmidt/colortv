window.onload = ->
  blank = document.createElement("canvas")
  bctx = blank.getContext('2d')

  original = new Image()
  original.onload = =>
    big = convert(original)
    display(big)
  original.src = 'orig.png'


convert = (img) ->
  console.log "convert()"
  orig = document.createElement("canvas")
  octx = orig.getContext('2d')
  octx.drawImage(img,0,0)

  imgdata = octx.getImageData(0,0,50,50)
  ht = imgdata.height
  wd = imgdata.width
  idata = imgdata.data
  console.log "idata ht,wd = #{ht},#{wd}"
  console.log "idata.length = #{idata.length}"
  zz = []
  for j in [0..19]
    zz.push(idata[j])
  i = 0
  for k in [0..3]
    console.log " "
    console.log "PIXEL #{i}"
    r = zz.shift()
    console.log "r = #{r}"
    g = zz.shift()
    console.log "g = #{g}"
    b = zz.shift()
    console.log "b = #{b}"
    a = zz.shift()
    console.log "a = #{a}"
    i = i + 1


display = (pxdata) ->
  console.log "display()"


  # imgdata = octx.getImageData
  # ht = imgdata.height
  # wd = imgdata.width
  # idata = imgdata.data
  # console.log "idata.length = #{idata.length}"

  # rdata = []
  # gdata = []
  # bdata = []
  # for i in [0..2499]
  #   a = idata.shift
  #   r = idata.shift
  #   g = idata.shift
  #   b = idata.shift
  #   rdata.push 0,r,0,0
  #   gdata.push 0,0,g,0
  #   bdata.push 0,0,0,b
  #   if i<5
  #     console.log " "
  #     console.log "PIXEL #{i}"
  #     console.log "r = #{r}"
  #     console.log "g = #{g}"
  #     console.log "b = #{b}"
