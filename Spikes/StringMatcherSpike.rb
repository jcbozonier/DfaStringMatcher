
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

class StartState<StandardState
  def initialize(id)
    @id = id
    @transitions = []
  end
end


class TerminalState < StandardState
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
    @literal == literal
  end
end