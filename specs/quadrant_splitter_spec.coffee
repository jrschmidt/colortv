describe "Dot quadrant splitter", ->

  beforeEach ->
    @splitter = new QuadrantSplitter


  it "should split a hex zone into quadrants at an arbitrary point and compute ratios of their areas", ->

    rrt = @splitter.ratios(0,0)
    expect(Math.abs(rrt[0] - 0.000)).toBeLessThan(0.001)
    expect(Math.abs(rrt[1] - 0.017)).toBeLessThan(0.001)
    expect(Math.abs(rrt[2] - 0.034)).toBeLessThan(0.001)
    expect(Math.abs(rrt[3] - 0.948)).toBeLessThan(0.001)

    rrt = @splitter.ratios(9,3)
    expect(Math.abs(rrt[0] - 0.213)).toBeLessThan(0.001)
    expect(Math.abs(rrt[1] - 0.017)).toBeLessThan(0.001)
    expect(Math.abs(rrt[2] - 0.623)).toBeLessThan(0.001)
    expect(Math.abs(rrt[3] - 0.145)).toBeLessThan(0.001)

    rrt = @splitter.ratios(6,6)
    expect(Math.abs(rrt[0] - 0.324)).toBeLessThan(0.001)
    expect(Math.abs(rrt[1] - 0.23)).toBeLessThan(0.001)
    expect(Math.abs(rrt[2] - 0.222)).toBeLessThan(0.001)
    expect(Math.abs(rrt[3] - 0.222)).toBeLessThan(0.001)

    rrt = @splitter.ratios(3,9)
    expect(Math.abs(rrt[0] - 0.239)).toBeLessThan(0.001)
    expect(Math.abs(rrt[1] - 0.615)).toBeLessThan(0.001)
    expect(Math.abs(rrt[2] - 0.017)).toBeLessThan(0.001)
    expect(Math.abs(rrt[3] - 0.128)).toBeLessThan(0.001)

    rrt = @splitter.ratios(9,10)
    expect(Math.abs(rrt[0] - 0.769)).toBeLessThan(0.001)
    expect(Math.abs(rrt[1] - 0.162)).toBeLessThan(0.001)
    expect(Math.abs(rrt[2] - 0.068)).toBeLessThan(0.001)
    expect(Math.abs(rrt[3] - 0.000)).toBeLessThan(0.001)

    rrt = @splitter.ratios(2,4)
    expect(Math.abs(rrt[0] - 0.051)).toBeLessThan(0.001)
    expect(Math.abs(rrt[1] - 0.282)).toBeLessThan(0.001)
    expect(Math.abs(rrt[2] - 0.111)).toBeLessThan(0.001)
    expect(Math.abs(rrt[3] - 0.555)).toBeLessThan(0.001)


  it "should split a hex zone into quadrants at an arbitrary point and compute their areas", ->

    spl = @splitter.split(0,0)
    expect(spl[0]).toEqual(0)
    expect(spl[1]).toEqual(2)
    expect(spl[2]).toEqual(4)
    expect(spl[3]).toEqual(111)

    spl = @splitter.split(9,3)
    expect(spl[0]).toEqual(25)
    expect(spl[1]).toEqual(2)
    expect(spl[2]).toEqual(73)
    expect(spl[3]).toEqual(17)

    spl = @splitter.split(6,6)
    expect(spl[0]).toEqual(38)
    expect(spl[1]).toEqual(27)
    expect(spl[2]).toEqual(26)
    expect(spl[3]).toEqual(26)

    spl = @splitter.split(3,9)
    expect(spl[0]).toEqual(28)
    expect(spl[1]).toEqual(72)
    expect(spl[2]).toEqual(2)
    expect(spl[3]).toEqual(15)

    spl = @splitter.split(9,10)
    expect(spl[0]).toEqual(90)
    expect(spl[1]).toEqual(19)
    expect(spl[2]).toEqual(8)
    expect(spl[3]).toEqual(0)

    spl = @splitter.split(2,4)
    expect(spl[0]).toEqual(6)
    expect(spl[1]).toEqual(33)
    expect(spl[2]).toEqual(13)
    expect(spl[3]).toEqual(65)
