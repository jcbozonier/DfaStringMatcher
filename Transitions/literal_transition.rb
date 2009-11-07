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