describe "Dot helpers", ->

  beforeEach ->
    @helper = new DotHelper

  it "should find the x,y coordinates of the centerpoint for dot a,b", ->
    xy = @helper.get_xy(1,16)
    expect(xy[0]).toEqual(3)
    expect(xy[1]).toEqual(3)

    xy = @helper.get_xy(3,16)
    expect(xy[0]).toEqual(10)
    expect(xy[1]).toEqual(4)

    xy = @helper.get_xy(4,17)
    expect(xy[0]).toEqual(13)
    expect(xy[1]).toEqual(10)

    xy = @helper.get_xy(20,121)
    expect(xy[0]).toEqual(17)
    expect(xy[1]).toEqual(590)

    xy = @helper.get_xy(67,48)
    expect(xy[0]).toEqual(218)
    expect(xy[1]).toEqual(212)

    xy = @helper.get_xy(99,62)
    expect(xy[0]).toEqual(323)
    expect(xy[1]).toEqual(305)

    xy = @helper.get_xy(122,35)
    expect(xy[0]).toEqual(417)
    expect(xy[1]).toEqual(168)

    xy = @helper.get_xy(150,101)
    expect(xy[0]).toEqual(482)
    expect(xy[1]).toEqual(545)

    xy = @helper.get_xy(161,14)
    expect(xy[0]).toEqual(564)
    expect(xy[1]).toEqual(72)

    xy = @helper.get_xy(182,107)
    expect(xy[0]).toEqual(591)
    expect(xy[1]).toEqual(594)
