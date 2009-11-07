require "standard_state"
require "start_state"
require "terminal_state"
require "literal_transition"

class StateBuilder
  def initialize
    @number_created
  end

  def create_from(string_reader)
    # First create start state
    @number_created = 0
    root = StartState.new(@number_created)
    current_state = root

    while !string_reader.end_of_string
      if string_reader.peek != nil
        current_character = string_reader.read
        
        previous_state = current_state
        current_state = _create_standard_state

        if current_character == "."
          current_transition = MatchAnyTransition.new(current_state, current_character)
        else
          current_transition = LiteralTransition.new(current_state, current_character)
        end
        previous_state.add_transition(current_transition)
      end

      if string_reader.end_of_string
        final_state = _create_terminal_state
        final_transition = AlwaysTransition.new(final_state, nil)

        current_state.add_transition(final_transition)
      end
    end

    return root
  end

  def _create_terminal_state
    @number_created += 1
    result = TerminalState.new(@number_created)
    return result
  end

  def _create_start_state
    @number_created = 0
    result = StandardState.new(@number_created)
    return result
  end

  def _create_standard_state
    @number_created += 1
    result = StandardState.new(@number_created)
    return result
  end
end