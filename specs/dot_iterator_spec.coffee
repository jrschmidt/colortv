describe "Dot iterator", ->

  beforeEach ->
    @iterator = new DotIterator

  it "should identify the first and last dot in column a", ->
    span = @iterator.get_span(0)
    expect(span[0]).toEqual(15)
    expect(span[1]).toEqual(21)
    span = @iterator.get_span(1)
    expect(span[0]).toEqual(16)
    expect(span[1]).toEqual(28)
    span = @iterator.get_span(8)
    expect(span[0]).toEqual(15)
    expect(span[1]).toEqual(77)
    span = @iterator.get_span(63)
    expect(span[0]).toEqual(10)
    expect(span[1]).toEqual(118)
    span = @iterator.get_span(100)
    expect(span[0]).toEqual(7)
    expect(span[1]).toEqual(115)
    span = @iterator.get_span(148)
    expect(span[0]).toEqual(3)
    expect(span[1]).toEqual(111)
    span = @iterator.get_span(181)
    expect(span[0]).toEqual(78)
    expect(span[1]).toEqual(108)
    span = @iterator.get_span(185)
    expect(span[0]).toEqual(106)
    expect(span[1]).toEqual(108)
