require "../../src/sudoku/index"
require "test/unit"

class IndexTest < Test::Unit::TestCase
  
  def testwhichcube
    
    assert_equal(0,Index.new(1,3).whichcube.index_x)
    assert_equal(0,Index.new(3,1).whichcube.index_y)
    assert_equal(1,Index.new(4,3).whichcube.index_x)
    assert_equal(1,Index.new(3,4).whichcube.index_y)
    assert_equal(2,Index.new(6,3).whichcube.index_x)
    assert_equal(2,Index.new(3,7).whichcube.index_y)
  end
end
