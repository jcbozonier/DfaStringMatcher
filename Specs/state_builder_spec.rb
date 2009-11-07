require 'state_builder'
require 'start_state'
require 'standard_state'
require 'always_transition'
require 'string_reader'

describe "When building a state from a string with one period" do
  before(:each) do
    @state_builder = StateBuilder.new
    @string_reader = StringReader.new(".")
    @graph = @state_builder.create_from(@string_reader)
  end

  it "should return a three state graph" do
    @graph.transitions[0].destination.transitions[0].destination.should_not == nil
  end

  it "should have a start state as the root node" do
    @graph.class.should == StartState
  end

  it "should have a match any state as the last node" do
    @graph.transitions[0].destination.class.should == StandardState
  end

  it "should have a terminal state as the last node" do
    @graph.transitions[0].destination.transitions[0].destination.class.should == TerminalState
  end
end

describe "When building a state from a string with one character" do
  before(:each) do
    @state_builder = StateBuilder.new
    @string_reader = StringReader.new("a")
    @graph = @state_builder.create_from(@string_reader)
  end

  it "should return a three state graph" do
    @graph.transitions[0].destination.transitions[0].destination.should_not == nil
  end

  it "should have a terminal state as the last node" do
    @graph.transitions[0].destination.transitions[0].destination.class.should == TerminalState
  end

  it "should have a standard state as the last node" do
    @graph.transitions[0].destination.class.should == StandardState
  end

  it "should have a literal state as the root node" do
    @graph.class.should == StartState
  end
end

