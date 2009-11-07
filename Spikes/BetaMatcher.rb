class LiteralTransition
  def initialize(literal, destination)
    @literal = literal
    @destination = destination
  end

  def can_transition(literal)
    literal == @literal
  end
end

class CompletedTransition
  def initialize(destination)
    @destination = destination
  end

  def can_transition(literal)
    true
  end
end

class MatchAnyTransition
  def value
    @value
  end

  def initialize(destination, value)
    @destination = destination
    @value = value
  end

  def can_transition(literal)
    true
  end
end

class MatchState
  def transitions
    @transitions
  end

  def initialize(id)
    @transitions = []
    @identifier = id
  end

  def add_transition(transition)
    @transitions << transition
  end

  def match_on(string)
    
  end
end

class StringReader
  def initialize(string)
    @string = string
    @current_index = -1
  end

  def read
    if !eof
      @current_index += 1
      return @string[@current_index]
    end

    return None
  end

  def peek
    if !eof
      return @string[@current_index + 1]
    end
    
    return None
  end

  def eof
    @current_index + 1 >= @string.length
  end
end

class MatchStateMachineBuilder
  def initialize
    states_created_count = 0
  end

  def build(pattern)
    patternReader = StringReader.new(pattern)

    from_state = None
    while !patternReader.eof
      from_state = _create_transition(from_state, patternReader.read)
    end
  end

  def _create_transition(from_state, for_character)
    if for_character == "."
      match_state = MatchState.new(states_created_count)
      transition = MatchAnyTransition.new(match_state, value)
      states_created_count += 1
    else if for_character == "*"
      match_state = MatchState.new(states_created_count)
      transition = MatchAnyTransition.new(match_state, value)
      states_created_count += 1
      
      transition = MatchAnyTransition.new(match_state, value)
      states_created_count += 1
    end

    return 
  end
end

class StringMatchDriver
  def initialize(starting_match_state)
    @starting_match_state = starting_match_state
  end

  def is_match(string)
    
  end
end
