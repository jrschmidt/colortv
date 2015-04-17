for ss in [102..116]
  t = ""
  v = ss
  while v >= 0
    t = t + "   #{v}"
    v = v - 15
  console.log t
