describe "Square to dot conversion helpers", ->

  beforeEach ->
    @helper = new SquareDotHelper


  it "should find the column of the 'RGB reference dot' of a given color for a square at xx,yy", ->
    col = @helper.get_dot_column('b',0,0,)
    expect(col).toEqual(1)
    col = @helper.get_dot_column('b',12,144)
    expect(col).toEqual(10)
    col = @helper.get_dot_column('r',24,360)
    expect(col).toEqual(17)
    col = @helper.get_dot_column('r',120,60)
    expect(col).toEqual(38)
    col = @helper.get_dot_column('g',0,504)
    expect(col).toEqual(15)
    col = @helper.get_dot_column('g',12,192)
    expect(col).toEqual(9)


  xit "should find the 'RGB reference dots' for a square at x,y", ->
    dots = @helper.get_dots(0,0,)
    expect(dots.b[0]).toEqual(1)
    expect(dots.b[1]).toEqual(16)
    expect(dots.r[0]).toEqual(2)
    expect(dots.r[1]).toEqual(17)
    expect(dots.g[0]).toEqual(3)
    expect(dots.g[1]).toEqual(16)
