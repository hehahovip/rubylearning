class Sudoku
  @array
  
  def initialize()
    # @array = array
    @array = [[9],[9]]
  end
    
  
  def print_result
    @array.each do |i|
      i.each do |j|
        print j 
        print " "
      end
      puts ""
      
    end
  end
end

instance = Sudoku.new
instance.print_result
