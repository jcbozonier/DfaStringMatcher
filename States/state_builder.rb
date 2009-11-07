require "standard_state"
require "start_state"
require "terminal_state"
require "literal_transition"

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