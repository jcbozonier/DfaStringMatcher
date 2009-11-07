class TerminalState < StandardState
  def initialize(id)
    @id = id
    @transitions = []
  end
end