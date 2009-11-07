require 'state_builder'
require 'StringReader'

@state_builder = StateBuilder.new
@string_reader = StringReader.new("a")
@graph = @state_builder.create_from(@string_reader)