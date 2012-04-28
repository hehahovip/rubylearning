require 'set'
class Sudoku
  Length = 9;
  
  def initialize()
    # @array = array
    @array = Array.new(Length,Array.new(Length,0))
  end
    
  def setvalues
     Length.times do |x|
      Length.times do |y|
       @array[x][y] = y+1
      end
     end
  end
  
  def checkrows
    
    length.times do |x|
      
    end
  end
  
  def checkrow (rownubmer)
    rowset = Set.new
    Length.times do |x|
      value = @array[rownubmer][x]
      puts "value: " + value.to_s
      if rowset.include?(value)
       then
        return false
       else
        rowset.add(value)
       end
    end
  end
  
  def checkcolume (columenumber)
    columearray = Array.new(Length,0)
    Length.times do |y|
      value = @array[y][columenumber]
      end
  end
  
  
  def print_result
      Length.times do |x|
      print @array[x]
      print "\n"
      end
  end
  
end
