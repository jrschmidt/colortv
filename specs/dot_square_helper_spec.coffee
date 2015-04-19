describe "Dot to square conversion helpers", ->

  beforeEach ->
    @helper = new DotSquareHelper


  xit "should find all squares that intersect a dot at a,b", ->

    squares = @helper.find_squares(1,16)
    expect(squares.length).toEqual(1)
    expect(squares[0][0]).toEqual(0)
    expect(squares[0][1]).toEqual(0)

    squares = @helper.find_squares(3,16)
    expect(squares.length).toEqual(2)
    expect(squares[0][0]).toEqual(0)
    expect(squares[0][1]).toEqual(0)
    expect(squares[1][0]).toEqual(1)
    expect(squares[1][1]).toEqual(0)

    squares = @helper.find_squares(2,17)
    expect(squares.length).toEqual(2)
    expect(squares[0][0]).toEqual(0)
    expect(squares[0][1]).toEqual(0)
    expect(squares[1][0]).toEqual(0)
    expect(squares[1][1]).toEqual(1)

    squares = @helper.find_squares(4,17)
    expect(squares.length).toEqual(4)
    expect(squares[0][0]).toEqual(0)
    expect(squares[0][1]).toEqual(0)
    expect(squares[1][0]).toEqual(1)
    expect(squares[1][1]).toEqual(0)
    expect(squares[2][0]).toEqual(0)
    expect(squares[2][1]).toEqual(1)
    expect(squares[3][0]).toEqual(1)
    expect(squares[3][1]).toEqual(1)

    squares = @helper.find_squares(19,40)
    expect(squares.length).toEqual(2)
    expect(squares[0][0]).toEqual(4)
    expect(squares[0][1]).toEqual(11)
    expect(squares[1][0]).toEqual(4)
    expect(squares[1][1]).toEqual(12)
