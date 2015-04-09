// Generated by CoffeeScript 1.9.1
var convert, display, insert, putpx;

window.onload = function() {
  var original;
  original = new Image();
  original.onload = (function(_this) {
    return function() {
      var bigdata;
      bigdata = convert(original);
      return display(bigdata);
    };
  })(this);
  return original.src = 'orig.png';
};

convert = function(img) {
  var b, big, bigctx, bigimgdata, g, grid, ht, i, idata, imgdata, l, m, n, octx, orig, r, wd;
  orig = document.createElement("canvas");
  octx = orig.getContext('2d');
  octx.drawImage(img, 0, 0);
  imgdata = octx.getImageData(0, 0, 50, 50);
  ht = imgdata.height;
  wd = imgdata.width;
  idata = imgdata.data;
  big = document.getElementById('big');
  bigctx = big.getContext('2d');
  bigimgdata = bigctx.createImageData(600, 600);
  grid = bigimgdata.data;
  for (n = i = 0; i <= 49; n = ++i) {
    for (m = l = 0; l <= 49; m = ++l) {
      r = idata[200 * n + 4 * m];
      g = idata[200 * n + 4 * m + 1];
      b = idata[200 * n + 4 * m + 2];
      insert(grid, m, n, r, g, b);
    }
  }
  return bigimgdata;
};

insert = function(gr, mm, nn, rr, gg, bb) {
  var bbb, cc, dots, ggg, i, j, j2, j3, k, results, rgb, rrr, zz;
  dots = [[6, 0, 6], [6, 0, 6], [6, 0, 6], [6, 0, 6], [6, 0, 6], [5, 2, 5], [4, 4, 4], [3, 6, 3], [3, 6, 3], [2, 8, 2], [1, 10, 1], [0, 12, 0]];
  rrr = [rr, 0, 0, 255];
  ggg = [0, gg, 0, 255];
  bbb = [0, 0, bb, 255];
  rgb = [rrr, bbb, ggg];
  zz = 28800 * nn + 48 * mm;
  results = [];
  for (k = i = 0; i <= 11; k = ++i) {
    j2 = 0;
    j3 = 0;
    results.push((function() {
      var l, o, ref, ref1, results1;
      results1 = [];
      for (cc = l = 0; l <= 2; cc = ++l) {
        if (dots[k][cc] > 0) {
          for (j = o = ref = j2, ref1 = j2 + dots[k][cc] - 1; ref <= ref1 ? o <= ref1 : o >= ref1; j = ref <= ref1 ? ++o : --o) {
            putpx(gr, rgb[cc], zz, k, j);
            j3 = j;
          }
          results1.push(j2 = j3 + 1);
        } else {
          results1.push(void 0);
        }
      }
      return results1;
    })());
  }
  return results;
};

putpx = function(gggg, rgba, zzzz, kkkk, jjjj) {
  var i, ii, ix, results;
  ix = zzzz + 2400 * kkkk + 4 * jjjj;
  results = [];
  for (ii = i = 0; i <= 3; ii = ++i) {
    results.push(gggg[ix + ii] = rgba[ii]);
  }
  return results;
};

display = function(pxdata) {
  var big, bigctx;
  big = document.getElementById('big');
  bigctx = big.getContext('2d');
  return bigctx.putImageData(pxdata, 0, 0);
};
