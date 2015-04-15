up = [1,2,3,4,6,6,5,5,5,5,4,4,2,1,0]
down = [0,1,2,4,4,5,5,5,6,6,5,4,3,2,1]

max_up = [6,5,4,3,2,1,0,0,0,0,0,0]
max_dn = [5,6,6,6,6,6,6,5,4,3,2,1]

area = []
area[j] = [] for j in [0..14]

for k in [0..11]
  val = []
  for j in [0..14]
    val[j] = Math.min(up[j], max_up[k]) + Math.min(down[j], max_dn[k])

  for j in [0..14]
    sum = 0
    for jj in [j..Math.min(j+11,14)]
      sum = sum + val[jj]
    area[j][k] = sum

console.log " "
for k in [0..11]
  str = "#{k}  "
  str = str + "#{area[j][k]}, " for j in [0..14]
  console.log str
