require 'sudoku'

instance = Sudoku.new
instance.setvalues
result = instance.checkrow(1)
puts "result: " + result.to_s
result =  instance.checkcolume(1)
puts "result: " + result.to_s
instance.print_result
