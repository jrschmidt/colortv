up = [3,4,5,7,7,6,6,6,6,5,5,3,2]
dn =[1,2,4,4,5,5,5,5,6,6,4,3,2]

split = (hx,hy) ->
  top = up.slice(0)
  btm = dn.slice(0)

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


rr = split(9,3)
console.log "#{rr[0]}  #{rr[1]}  #{rr[2]}  #{rr[3]}"
