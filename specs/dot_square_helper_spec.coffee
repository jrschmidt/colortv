describe "Dot to square conversion helpers", ->

  beforeEach ->
    @helper = new DotSquareHelper


  it "should find the 12x12 square containing point x,y", ->

    xy12 = @helper.get_xxyy(0,0)
    expect(xy12.xxyy).toEqual([0,0])
    expect(xy12.dxy).toEqual([0,0])

    xy12 = @helper.get_xxyy(19,8)
    expect(xy12.xxyy).toEqual([1,0])
    expect(xy12.dxy).toEqual([7,8])

    xy12 = @helper.get_xxyy(433,293)
    expect(xy12.xxyy).toEqual([36,24])
    expect(xy12.dxy).toEqual([1,5])

    xy12 = @helper.get_xxyy(279,527)
    expect(xy12.xxyy).toEqual([23,43])
    expect(xy12.dxy).toEqual([3,11])

    xy12 = @helper.get_xxyy(382,177)
    expect(xy12.xxyy).toEqual([31,14])
    expect(xy12.dxy).toEqual([10,9])

    xy12 = @helper.get_xxyy(351,444)
    expect(xy12.xxyy).toEqual([29,37])
    expect(xy12.dxy).toEqual([3,0])


  it "should identify and locate the squares that intersect the 'hex zone' for dot a,b", ->

    sqq = @helper.find_squares(1,16)
    expect(sqq.xxyy).toEqual( [-1,-1] )
    expect(sqq.dxy).toEqual( [2,2] )
    expect(sqq.squares[0]).toEqual(null)
    expect(sqq.squares[1]).toEqual(null)
    expect(sqq.squares[2]).toEqual(null)
    expect(sqq.squares[3]).toEqual( [0,0] )

    sqq = @helper.find_squares(3,16)
    expect(sqq.xxyy).toEqual( [0,-1] )
    expect(sqq.dxy).toEqual( [7,1] )
    expect(sqq.squares[0]).toEqual(null)
    expect(sqq.squares[1]).toEqual(null)
    expect(sqq.squares[2]).toEqual( [0,0] )
    expect(sqq.squares[3]).toEqual( [1,0] )

    sqq = @helper.find_squares(2,17)
    expect(sqq.xxyy).toEqual( [0,0] )
    expect(sqq.dxy).toEqual( [11,8] )
    expect(sqq.squares[0]).toEqual( [0,0] )
    expect(sqq.squares[1]).toEqual( [1,0] )
    expect(sqq.squares[2]).toEqual( [0,1] )
    expect(sqq.squares[3]).toEqual( [1,1] )

    sqq = @helper.find_squares(4,17)
    expect(sqq.xxyy).toEqual( [0,0] )
    expect(sqq.dxy).toEqual( [4,7] )
    expect(sqq.squares[0]).toEqual( [0,0] )
    expect(sqq.squares[1]).toEqual( [1,0] )
    expect(sqq.squares[2]).toEqual( [0,1] )
    expect(sqq.squares[3]).toEqual( [1,1] )

    sqq = @helper.find_squares(19,40)
    expect(sqq.xxyy).toEqual( [4,11] )
    expect(sqq.dxy).toEqual( [11,5] )
    expect(sqq.squares[0]).toEqual( [4,11] )
    expect(sqq.squares[1]).toEqual( [5,11] )
    expect(sqq.squares[2]).toEqual( [4,12] )
    expect(sqq.squares[3]).toEqual( [5,12] )

    sqq = @helper.find_squares(99,44)
    expect(sqq.xxyy).toEqual( [27,16] )
    expect(sqq.dxy).toEqual( [9,3] )
    expect(sqq.squares[0]).toEqual( [27,16] )
    expect(sqq.squares[1]).toEqual( [28,16] )
    expect(sqq.squares[2]).toEqual( [27,17] )
    expect(sqq.squares[3]).toEqual( [28,17] )

    sqq = @helper.find_squares(0,15)
    expect(sqq.xxyy).toEqual( [-1,-1] )
    expect(sqq.dxy).toEqual( [5,8] )
    expect(sqq.squares[0]).toEqual(null)
    expect(sqq.squares[1]).toEqual(null)
    expect(sqq.squares[2]).toEqual(null)
    expect(sqq.squares[3]).toEqual( [0,0] )

    sqq = @helper.find_squares(0,17)
    expect(sqq.xxyy).toEqual( [-1,0] )
    expect(sqq.dxy).toEqual( [6,9] )
    expect(sqq.squares[0]).toEqual(null)
    expect(sqq.squares[1]).toEqual( [0,0] )
    expect(sqq.squares[2]).toEqual(null)
    expect(sqq.squares[3]).toEqual( [0,1] )

    sqq = @helper.find_squares(4,15)
    expect(sqq.xxyy).toEqual( [0,-1] )
    expect(sqq.dxy).toEqual( [3,6] )
    expect(sqq.squares[0]).toEqual(null)
    expect(sqq.squares[1]).toEqual(null)
    expect(sqq.squares[2]).toEqual( [0,0] )
    expect(sqq.squares[3]).toEqual( [1,0] )

    sqq = @helper.find_squares(112,5)
    expect(sqq.xxyy).toEqual( [32,-1] )
    expect(sqq.dxy).toEqual( [4,7] )
    expect(sqq.squares[0]).toEqual(null)
    expect(sqq.squares[1]).toEqual(null)
    expect(sqq.squares[2]).toEqual( [32,0] )
    expect(sqq.squares[3]).toEqual( [33,0] )
