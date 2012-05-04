require './stack'
require './index'
require './stepinfo'
require 'set'

class Sudoku
  Length = 9;
  Cube_length = 3;
  def initialize
    @array = Array.new(Length,Array.new(Length,0))
    @arrayflag = Array.new(Length,Array.new(Length,0))
    @route = Stack.new
    @chkflag = false
  end

  def initcheck
    Length.times do |x|
      Length.times do |y|
        if @array[x][y] ==0
        then
        @arrayflag[x][y] = false
        else
        @arrayflag[x][y] = true
        end
      end
    end
  end

  def computing
    self.initcheck
    jumpflag = false
    while x < Length do
        while y < Length do
          
          if not @arrayflag[x][y] == 0
          then
            if jumpflag
              then
              @chkflag = matchingcell(x, y, @tempvalue + 1)
            else
              @chkflag = matchingcell(x, y)
            end
            if @chkflag
              then
                self.forwardstep(x, y, @array[x][y])
                next
            else
              @backstepinfo = self.backstep
              jumpflag = true
              x = @backstepinfo.index.index_x
              y = @backstepinfo.index.index_y
            end
          end
          if not jumpflag
            then
            y = y + 1
          else
            @tempvalue = @backstepinfo.value
          end
        end
        x = x + 1
    end
        
    # finish all loops, check flag
    if @chkflag
      then
      puts "Finish computing."
      self.print_result
    else
      puts "No result!!!"
      self.print_result
    end
    
  end

  def matchingcell(x, y, min = 1)
      while min < Length + 1       
        self.setvalue(x, y, value)
        chkflag = checkrow(x)
        chkflag = chkflag and checkcolume(y)
        chkflag = chkflag and chkcube(Index.new(x,y).whichcube)
        min  = min + 1
        if not chkflag
        then next
        else
        break
        end
      end
  end

  def setvalue(x, y, value)
    @array[x][y] = value
  end

  def setvalues
    Length.times do |x|
      Length.times do |y|
       setvalue(x, y, 0)
      end
    end
  end

  def forwardstep(x, y, value)
    @route.push(StepInfo.new(Index.new(x, y),value))
  end

  def backstep
    if @route.empty?()
      then
      return nil
    else
      backstepinfo = @route.pop

      #set the value to 0 in array
      setvalue(backstepinfo.index.index_x, backstepinfo.index.index_y, 0)
    return backstepinfo
    end
  end

  def chkcube(cubeindex)
    cubeset = Set.new
    Cube_length.times do |x|
      Cube_length.times do |y|
        value = @array[cubeindex.index_x * 3 + x][cubeindex.index_y * 3 + y]
        if cubeset.include?(value)
        then
        return false;
        else
        cubeset.add(value)
        end
      end
    end
    return true
  end

  def checkrow (rownumber)
    rowset = Set.new
    Length.times do |x|
      value = @array[rownumber][x]
      if rowset.include?(value)
      then
      return false
      else
      rowset.add(value)
      end
    end
    return true
  end

  def checkcolume (columenumber)
    columeset = Set.new
    Length.times do |y|
      value = @array[y][columenumber]
      if columeset.include?(value)
      then
      return false
      else
      columeset.add(value)
      end
    end
    return true
  end

  def print_result
    Length.times do |x|
      print @array[x]
      print "\n"
    end
  end

end