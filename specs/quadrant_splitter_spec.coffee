describe "Dot quadrant splitter", ->

  beforeEach ->
    @splitter = new QuadrantSplitter


  it "should split a hex zone into quadrants at an arbitrary point and compute ratios of their areas", ->

    rrt = @splitter.ratios(0,0)
    expect(rrt[0]).toBeCloseTo(0.000, 3)
    expect(rrt[1]).toBeCloseTo(0.017, 3)
    expect(rrt[2]).toBeCloseTo(0.034, 3)
    expect(rrt[3]).toBeCloseTo(0.948, 3)

    rrt = @splitter.ratios(9,3)
    expect(rrt[0]).toBeCloseTo(0.213, 3)
    expect(rrt[1]).toBeCloseTo(0.017, 3)
    expect(rrt[2]).toBeCloseTo(0.623, 3)
    expect(rrt[3]).toBeCloseTo(0.145, 3)

    rrt = @splitter.ratios(6,6)
    expect(rrt[0]).toBeCloseTo(0.324, 3)
    expect(rrt[1]).toBeCloseTo(0.23, 3)
    expect(rrt[2]).toBeCloseTo(0.222, 3)
    expect(rrt[3]).toBeCloseTo(0.222, 3)

    rrt = @splitter.ratios(3,9)
    expect(rrt[0]).toBeCloseTo(0.239, 3)
    expect(rrt[1]).toBeCloseTo(0.615, 3)
    expect(rrt[2]).toBeCloseTo(0.017, 3)
    expect(rrt[3]).toBeCloseTo(0.128, 3)

    rrt = @splitter.ratios(9,10)
    expect(rrt[0]).toBeCloseTo(0.769, 3)
    expect(rrt[1]).toBeCloseTo(0.162, 3)
    expect(rrt[2]).toBeCloseTo(0.068, 3)
    expect(rrt[3]).toBeCloseTo(0.000, 3)

    rrt = @splitter.ratios(2,4)
    expect(rrt[0]).toBeCloseTo(0.051, 3)
    expect(rrt[1]).toBeCloseTo(0.282, 3)
    expect(rrt[2]).toBeCloseTo(0.111, 3)
    expect(rrt[3]).toBeCloseTo(0.555, 3)


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
