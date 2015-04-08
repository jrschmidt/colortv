window.onload = ->
  # orig = document.getElementById 'orig'
  # octx = orig.getContext '2d'

  orig = new Image()
  orig.onload = =>
    big = @convert(orig)
    @display(big)
  orig.src = 'orig.png'


convert = (orig) ->
  console.log "convert()"
  return [44,55,66,77]
  # blank = document.createElement("canvas")
  # bctx = blank.getContext '2d'


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
