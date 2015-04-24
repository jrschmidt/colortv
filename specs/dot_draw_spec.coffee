describe "Dot drawing functions", ->

  beforeEach ->
    @draw = new DotDraw

  it "should find all the pixels for a dot a,b", ->
    dots = @draw.get_pixels(33,22)
    expect(dots.length).toEqual(37)
    expect(dots).toContain([112,52])
    expect(dots).toContain([109,52])
    expect(dots).toContain([114,54])
    expect(dots).toContain([112,55])
    expect(dots).toContain([115,53])
    expect(dots).toContain([111,49])
    expect(dots).toContain([112,49])
    expect(dots).toContain([113,55])
    expect(dots).not.toContain([109,50])
    expect(dots).not.toContain([115,55])
    expect(dots).not.toContain([388,502])
    expect(dots).not.toContain([400,200])
