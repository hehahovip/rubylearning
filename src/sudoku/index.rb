class Index

  def initialize(x, y)
    @index_x = x
    @index_y = y
  end
  
  def whichcube()
    row = (@index_x / 3)
    colume = (@index_y / 3)
    Index.new(row,colume)
  end
  
  attr_reader :index_x
  attr_reader :index_y

end
