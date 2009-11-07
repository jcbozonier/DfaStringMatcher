require "StringMatcherSpike"

class StateBuilder
  def create_from(string_reader)
    # First create start state
    number_created = 0
    root = StartState.new(number_created)
    current_state = root

    while !string_reader.end_of_string
      if string_reader.peek != nil
        current_character = string_reader.read
        # if the current character is not a . or *
        # then we need to create a new standard state
        # we also need to create a standard transition

        #if current_character != "." && current_character != "*"
          previous_state = current_state
          current_state = StandardState.new(number_created)
          number_created += 1

          current_transition = LiteralTransition.new(current_state, current_character)
          number_created += 1

          previous_state.add_transition(current_transition)
        #end
      end

      if string_reader.end_of_string
        final_state = TerminalState.new(number_created)
        final_transition = AlwaysTransition.new(final_state, nil)

        current_state.add_transition(final_transition)
      end
    end

    return root
  end
end