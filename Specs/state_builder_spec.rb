# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'state_builder'
require 'StringReader'

describe "When building a state from a string with one character" do
  before(:each) do
    @state_builder = StateBuilder.new
    @string_reader = StringReader.new("a")
    @graph = @state_builder.create_from(@string_reader)
  end

  it "should return a three state graph" do
    @graph.transitions[0].destination.transitions[0].destination.should_not == nil
  end

  it "should have a start state as the root node" do
    @graph.class.should == StartState
  end
end

