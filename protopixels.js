// Generated by CoffeeScript 1.9.1
var ColorTvApp, DotDraw, DotHelper, DotIterator, DotSquareHelper, QuadrantSplitter,
  indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

window.onload = function() {
  var original;
  original = new Image();
  original.onload = (function(_this) {
    return function() {
      var colortv;
      colortv = new ColorTvApp;
      return colortv.repixelize(original);
    };
  })(this);
  return original.src = 'orig.png';
};

ColorTvApp = (function() {
  function ColorTvApp() {
    this.dots = new DotDraw;
    this.iterator = new DotIterator;
  }

  ColorTvApp.prototype.repixelize = function(original) {
    var bigdata;
    bigdata = this.convert(original);
    return this.display(bigdata);
  };

  ColorTvApp.prototype.convert = function(img) {
    var a, b, big, bigctx, bigimgdata, grid, ht, idata, imgdata, l, m, octx, orig, ref, ref1, span, wd;
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
    for (a = l = 0; l <= 185; a = ++l) {
      span = this.iterator.get_span(a);
      for (b = m = ref = span[0], ref1 = span[1]; m <= ref1; b = m += 2) {
        this.dots.build_dot(grid, a, b);
      }
    }
    return bigimgdata;
  };

  ColorTvApp.prototype.display = function(pxdata) {
    var big, bigctx;
    big = document.getElementById('big');
    bigctx = big.getContext('2d');
    return bigctx.putImageData(pxdata, 0, 0);
  };

  return ColorTvApp;

})();

DotDraw = (function() {
  function DotDraw() {
    this.dot_helper = new DotHelper;
    this.shape = [1, 2, 3, 3, 3, 2, 1];
  }

  DotDraw.prototype.build_dot = function(grid, a, b) {
    var rgb;
    switch (a % 3) {
      case 0:
        rgb = [0, 255, 0];
        break;
      case 1:
        rgb = [0, 0, 255];
        break;
      case 2:
        rgb = [255, 0, 0];
    }
    return this.draw_dot(grid, a, b, rgb);
  };

  DotDraw.prototype.draw_dot = function(grid, a, b, rgb) {
    var dots, l, len, px, results;
    rgb.push(255);
    dots = this.get_pixels(a, b);
    results = [];
    for (l = 0, len = dots.length; l < len; l++) {
      px = dots[l];
      results.push(this.draw_pixel(grid, px, rgb));
    }
    return results;
  };

  DotDraw.prototype.draw_pixel = function(grid, px, rgba) {
    var i, ix, l, results;
    ix = 2400 * px[1] + 4 * px[0];
    results = [];
    for (i = l = 0; l <= 3; i = ++l) {
      results.push(grid[ix + i] = rgba[i]);
    }
    return results;
  };

  DotDraw.prototype.get_pixels = function(a, b) {
    var cx, cxy, cy, k, l, m, pxx, ref, ref1, x, y;
    pxx = [];
    cxy = this.dot_helper.get_xy(a, b);
    cx = cxy[0];
    cy = cxy[1];
    for (k = l = 0; l <= 6; k = ++l) {
      y = cy + k - 3;
      for (x = m = ref = cx - this.shape[k], ref1 = cx + this.shape[k]; ref <= ref1 ? m <= ref1 : m >= ref1; x = ref <= ref1 ? ++m : --m) {
        if (x >= 0 && x < 600 && y >= 0 && y < 600) {
          pxx.push([x, y]);
        }
      }
    }
    return pxx;
  };

  return DotDraw;

})();

DotIterator = (function() {
  function DotIterator() {}

  DotIterator.prototype.get_span = function(col) {
    var bottom, l, m, results, results1, top;
    if (indexOf.call((function() {
      results = [];
      for (l = 0; l <= 169; l++){ results.push(l); }
      return results;
    }).apply(this), col) >= 0) {
      if (col % 2 === 0) {
        top = 15 - 2 * Math.floor(col / 22);
      } else {
        top = 16 - 2 * Math.floor((col + 11) / 22);
      }
    }
    if (indexOf.call([170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185], col) >= 0) {
      top = 1 + 7 * (col - 170);
    }
    if (indexOf.call([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], col) >= 0) {
      bottom = 7 * (col + 3);
    }
    if (indexOf.call((function() {
      results1 = [];
      for (m = 15; m <= 185; m++){ results1.push(m); }
      return results1;
    }).apply(this), col) >= 0) {
      if (col % 2 === 0) {
        bottom = 123 - 2 * Math.floor((col - 2) / 22);
      } else {
        bottom = 122 - 2 * Math.floor((col - 13) / 22);
      }
    }
    return [top, bottom];
  };

  return DotIterator;

})();

DotSquareHelper = (function() {
  function DotSquareHelper() {
    this.dot_helper = new DotHelper;
  }

  DotSquareHelper.prototype.find_squares = function(a, b) {
    var ad, adjust, dot_dxy, dot_xxyy, dot_xy, k, l, len, m, qdx, qdy, quad_xxyy, sq, sqq, sqx, sqy, xy12;
    dot_xy = this.dot_helper.get_xy(a, b);
    xy12 = this.get_xxyy(dot_xy[0], dot_xy[1]);
    dot_xxyy = xy12.xxyy;
    dot_dxy = xy12.dxy;
    if (dot_dxy[0] < 6) {
      qdx = 5 - dot_dxy[0];
    } else {
      qdx = 17 - dot_dxy[0];
    }
    if (dot_dxy[1] < 6) {
      qdy = 5 - dot_dxy[1];
    } else {
      qdy = 17 - dot_dxy[1];
    }
    if (dot_dxy[0] < 6) {
      if (dot_dxy[1] < 6) {
        adjust = [[-1, -1], [0, -1], [-1, 0], [0, 0]];
      } else {
        adjust = [[-1, 0], [0, 0], [-1, 1], [0, 1]];
      }
    } else {
      if (dot_dxy[1] < 6) {
        adjust = [[0, -1], [1, -1], [0, 0], [1, 0]];
      } else {
        adjust = [[0, 0], [1, 0], [0, 1], [1, 1]];
      }
    }
    sq = [];
    for (l = 0, len = adjust.length; l < len; l++) {
      ad = adjust[l];
      sqx = dot_xxyy[0] + ad[0];
      sqy = dot_xxyy[1] + ad[1];
      sq.push([sqx, sqy]);
    }
    quad_xxyy = sq[0];
    for (k = m = 0; m <= 3; k = ++m) {
      if (sq[k][0] < 0 || sq[k][0] > 49 || sq[k][1] < 0 || sq[k][1] > 49) {
        sq[k] = null;
      }
    }
    sqq = {
      xxyy: quad_xxyy,
      dxy: [qdx, qdy],
      squares: sq
    };
    return sqq;
  };

  DotSquareHelper.prototype.get_xxyy = function(x, y) {
    var dx, dy, xx, yy;
    xx = Math.floor(x / 12);
    yy = Math.floor(y / 12);
    dx = x % 12;
    dy = y % 12;
    return {
      xxyy: [xx, yy],
      dxy: [dx, dy]
    };
  };

  return DotSquareHelper;

})();

DotHelper = (function() {
  function DotHelper() {}

  DotHelper.prototype.get_xy = function(a, b) {
    if (a % 2 === 0) {
      return this.even_xy(a, b);
    } else {
      return this.odd_xy(a, b);
    }
  };

  DotHelper.prototype.even_xy = function(a, b) {
    var od, x, y;
    od = this.odd_xy(a - 1, b - 1);
    x = od[0] + 3;
    y = od[1] + 6;
    return [x, y];
  };

  DotHelper.prototype.odd_xy = function(a, b) {
    var x, y;
    x = 7.5 + 3.5 * a - 0.5 * b;
    y = 0.5 * a + 5.5 * b - 85.5;
    return [x, y];
  };

  return DotHelper;

})();

QuadrantSplitter = (function() {
  function QuadrantSplitter() {
    this.up = [3, 4, 5, 7, 7, 6, 6, 6, 6, 5, 5, 3, 2];
    this.dn = [1, 2, 4, 4, 5, 5, 5, 5, 6, 6, 4, 3, 2];
  }

  QuadrantSplitter.prototype.ratios = function(hx, hy) {
    var l, len, q, rr, spl;
    spl = this.split(hx, hy);
    rr = [];
    for (l = 0, len = spl.length; l < len; l++) {
      q = spl[l];
      rr.push(q / 117);
    }
    return rr;
  };

  QuadrantSplitter.prototype.split = function(hx, hy) {
    var btm, cut, dn_trim, j, l, m, n, o, qa, qb, qc, qd, ref, ref1, top, up_trim;
    top = this.up.slice(0);
    btm = this.dn.slice(0);
    if (hy < 6) {
      up_trim = 6 - hy;
    } else {
      up_trim = 0;
    }
    if (hy > 6) {
      dn_trim = hy - 6;
    } else {
      dn_trim = 0;
    }
    if (hy < 6) {
      for (j = l = 0; l <= 12; j = ++l) {
        cut = Math.min(top[j], up_trim);
        top[j] = top[j] - cut;
        btm[j] = btm[j] + cut;
      }
    }
    if (hy > 6) {
      for (j = m = 0; m <= 12; j = ++m) {
        cut = Math.min(btm[j], dn_trim);
        btm[j] = btm[j] - cut;
        top[j] = top[j] + cut;
      }
    }
    qa = 0;
    qb = 0;
    qc = 0;
    qd = 0;
    for (j = n = 0, ref = hx; 0 <= ref ? n <= ref : n >= ref; j = 0 <= ref ? ++n : --n) {
      qa += top[j];
      qc += btm[j];
    }
    for (j = o = ref1 = hx + 1; ref1 <= 12 ? o <= 12 : o >= 12; j = ref1 <= 12 ? ++o : --o) {
      qb += top[j];
      qd += btm[j];
    }
    return [qa, qb, qc, qd];
  };

  return QuadrantSplitter;

})();
