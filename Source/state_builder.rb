class StateBuilder
  def initialize
    @number_created
  end

  def create_from(string_reader)
    root = _create_start_state
    current_state = root

    string_reader.read_each do |current_character|
      current_transition = create_transition(current_character, current_state)
      current_state.add_transition(current_transition)
      current_state = current_transition.destination
    end

    final_state = _create_terminal_state
    final_transition = AlwaysTransition.new(final_state, nil)
    current_state.add_transition(final_transition)

    return root
  end

  def create_transition(match_token, previous_state)
    case match_token
      when "." then MatchAnyTransition.new(_create_standard_state, match_token)
      when "*" then MatchAnyTransition.new(previous_state, match_token)
      else LiteralTransition.new(_create_standard_state, match_token)
    end

    return current_transition
  end

  def _create_terminal_state
    @number_created += 1
    result = TerminalState.new(@number_created)
    return result
  end

  def _create_start_state
    @number_created = 0
    result = StartState.new(@number_created)
    return result
  end

  def _create_standard_state
    @number_created += 1
    result = StandardState.new(@number_created)
    return result
  end
end

class StandardState
  def transitions
    @transitions
  end

  def id
    @id
  end

  def initialize(id)
    @id = id
    @transitions = []
  end

  def add_transition(transition)
    if transition == nil
      raise Exception.new("transition can NOT be nil!!!")
    end

    if @transitions == nil
      raise Exception.new("@transition can NOT be nil!!!")
    end

    @transitions << transition
  end
end


class StateBuilder
  def initialize
    @number_created
  end

  def create_from(string_reader)
    root = _create_start_state
    current_state = root

    string_reader.read_each do |current_character|
      current_transition = create_transition(current_character, current_state)
      current_state.add_transition(current_transition)
      current_state = current_transition.destination
    end

    final_state = _create_terminal_state
    final_transition = AlwaysTransition.new(final_state, nil)
    current_state.add_transition(final_transition)

    return root
  end

  def create_transition(match_token, previous_state)
    case match_token
      when "." then MatchAnyTransition.new(_create_standard_state, match_token)
      when "*" then MatchAnyTransition.new(previous_state, match_token)
      else LiteralTransition.new(_create_standard_state, match_token)
    end
  end

  def _create_terminal_state
    @number_created += 1
    result = TerminalState.new(@number_created)
    return result
  end

  def _create_start_state
    @number_created = 0
    result = StartState.new(@number_created)
    return result
  end

  def _create_standard_state
    @number_created += 1
    result = StandardState.new(@number_created)
    return result
  end
end

class StandardState
  def transitions
    @transitions
  end

  def id
    @id
  end

  def initialize(id)
    @id = id
    @transitions = []
  end

  def add_transition(transition)
    if transition == nil
      raise Exception.new("transition can NOT be nil!!!")
    end

    if @transitions == nil
      raise Exception.new("@transition can NOT be nil!!!")
    end

    @transitions << transition
  end
end

class TerminalState < StandardState
  def initialize(id)
    @id = id
    @transitions = []
  end
end

class StartState<StandardState
  def initialize(id)
    @id = id
    @transitions = []
  end
end

class AlwaysTransition
  def destination
    @destination
  end

  def initialize(destination_state, literal)
    @destination = destination_state
    @literal = literal
  end

  def can_do(literal)
    true
  end
end

class LiteralTransition
  def destination
    @destination
  end

  def initialize(destination_state, literal)
    @destination = destination_state
    @literal = literal
  end

  def can_do(literal)
    @literal == literal
  end
end

class MatchAnyTransition
  def destination
    @destination
  end

  def initialize(destination_state, literal)
    @destination = destination_state
    @literal = literal
  end

  def can_do(literal)
    true
  end
end