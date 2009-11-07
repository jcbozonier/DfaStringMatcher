class StringReader
  def initialize(string)
    @string = string
    @current_index = -1
  end

  def peek
    if end_of_string
      return nil
    end
    
    @string[@current_index + 1, 1]
  end

  def read
    if end_of_string
      raise Exception.new("Tried to read past end of string! Je n'aime pas que!")
    end

    @current_index += 1
    @string[@current_index, 1]
  end

  def read_each
    while !end_of_string
      yield read
    end
  end

  def end_of_string
    @current_index == @string.length - 1
  end
end