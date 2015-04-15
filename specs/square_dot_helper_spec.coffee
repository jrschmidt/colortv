describe "Square to dot conversion helpers", ->

  beforeEach ->
    @helper = new SquareDotHelper

  it "should find the correct starting dot column for a value of xx", ->
    col = @helper.get_dot_col(8,5)
    expect(col).toEqual(10)




  # beforeEach ->
  #   @helpers = new ParseHelpers
  #
  # it "should correctly parse line numbers", ->
  #
  #   result = @helpers.look_for_line_number('10 REM WELCOME TO GRANDPA BASIC 80')
  #   expect(result.match).toEqual("yes")
  #   expect(result.parse_object[0]).toEqual("<line_number>")
  #   expect(result.parse_object[1]).toEqual(10)
  #   expect(result.remainder).toEqual(' REM WELCOME TO GRANDPA BASIC 80')
