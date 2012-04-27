class Sudoku
  
  def initialize()
    # @array = array
    @array = Array.new(9,Array.new(9))
  end
    
  def setvalues
     length = @array.length
     length.times do |x|
      length.times do |y|
       @array[x][y] = y
      end
     end
  end
  
  def print_result
      length = @array.length
      length.times do |x|
      print @array[x]
      print "\n"
      end
  end
  
end

