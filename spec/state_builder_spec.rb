require 'Source/state_builder'

describe "When building a three pattern with a match any multiple in the middle" do
  before(:each) do
    @state_builder = StateBuilder.new
    @graph = @state_builder.create_from("a*.")
  end

  it "should return a five state graph" do
    @graph.transitions[0].destination.transitions[0].destination.transitions[0].destination.transitions[0].destination.should_not == nil
  end

  it "should start with a start state" do
    @graph.class.should == StartState
  end

  it "should have a standard state as the 2nd state" do
    @graph.transitions[0].destination.class.should == StandardState
  end

  it "should have a standard state as the 3rd state" do
    @graph.transitions[0].destination.transitions[0].destination.class.should == StandardState
  end

  it "should have a standard state as the 4th state" do
    @graph.transitions[0].destination.transitions[0].destination.transitions[0].destination.class.should == StandardState
  end

  it "should have a terminal state as the 5th state" do
    @graph.transitions[0].destination.transitions[0].destination.transitions[1].destination.transitions[0].destination.class.should == TerminalState
  end
end

describe "When building a state from a string with one *" do
  before(:each) do
    @state_builder = StateBuilder.new
    @graph = @state_builder.create_from("*")
  end

  it "should return a two state graph" do
    @graph.transitions[0].destination.should_not == nil
  end

  it "should have a match any transition" do
    @graph.transitions[0].class.should == MatchAnyTransition
  end

  it "should have a match-any transition that transitions to the start state" do
    @graph.transitions[0].destination.should == @graph
  end

  it "should have a match-always transition that transitions to the start state" do
    @graph.transitions[1].destination.should_not == @graph
  end

  it "should have a start state as the root node" do
    @graph.class.should == StartState
  end

  it "should have a terminal state as the last node" do
    @graph.transitions[1].destination.class.should == TerminalState
  end
end

describe "When building a state from a string with one period" do
  before(:each) do
    @state_builder = StateBuilder.new
    @graph = @state_builder.create_from(".")
  end

  it "should return a three state graph" do
    @graph.transitions[0].destination.transitions[0].destination.should_not == nil
  end

  it "should have a match any transition" do
    @graph.transitions[0].class.should == MatchAnyTransition
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
    @graph = @state_builder.create_from("a")
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

  it "should have a start state as the root node" do
    @graph.class.should == StartState
  end
end

