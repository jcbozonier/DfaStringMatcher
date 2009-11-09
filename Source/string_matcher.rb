require "string_reader"
require "state_builder"

class StringMatcher
  def is_match(pattern, test_string)
    state_builder = StateBuilder.new
    graph = state_builder.create_from(StringReader.new(pattern))

    reader = StringReader.new(test_string)
    next_states = [graph]
    while !reader.end_of_string
      test_states = next_states
      next_states = []
      current_character = reader.read

      test_states.each do |state|
        state.transitions.each do |transition|
          if transition.can_do(current_character)
            next_states << transition.destination
          end
        end
      end
    end

    next_states.each do |state|
      state.transitions.each do |transition|
        if transition.class == AlwaysTransition and transition.destination.class == TerminalState
          return true
        end
      end
    end

    return false
  end
end