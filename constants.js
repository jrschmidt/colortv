// Generated by CoffeeScript 1.9.1
var area, down, i, j, jj, k, l, m, max_dn, max_up, n, o, p, q, ref, ref1, str, sum, up, val;

up = [1, 2, 3, 4, 6, 6, 5, 5, 5, 5, 4, 4, 2, 1, 0];

down = [0, 1, 2, 4, 4, 5, 5, 5, 6, 6, 5, 4, 3, 2, 1];

max_up = [6, 5, 4, 3, 2, 1, 0, 0, 0, 0, 0, 0];

max_dn = [5, 6, 6, 6, 6, 6, 6, 5, 4, 3, 2, 1];

area = [];

for (j = i = 0; i <= 14; j = ++i) {
  area[j] = [];
}

for (k = l = 0; l <= 11; k = ++l) {
  val = [];
  for (j = m = 0; m <= 14; j = ++m) {
    val[j] = Math.min(up[j], max_up[k]) + Math.min(down[j], max_dn[k]);
  }
  for (j = n = 0; n <= 14; j = ++n) {
    sum = 0;
    for (jj = o = ref = j, ref1 = Math.min(j + 11, 14); ref <= ref1 ? o <= ref1 : o >= ref1; jj = ref <= ref1 ? ++o : --o) {
      sum = sum + val[jj];
    }
    area[j][k] = sum;
  }
}

console.log(" ");

for (k = p = 0; p <= 11; k = ++p) {
  str = k + "  ";
  for (j = q = 0; q <= 14; j = ++q) {
    str = str + (area[j][k] + ", ");
  }
  console.log(str);
}