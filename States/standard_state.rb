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