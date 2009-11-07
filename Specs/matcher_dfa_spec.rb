require "spec"
require "matcherdfa"

describe "When parsing a string of literals" do
  before do                               
    @dfaBuilder = MatcherDfa.new("a.b")
    @dfaRoot = @dfaBuilder.Root
  end

  it "should create a graph node for each literal" do
    true.should == @dfaRoot.edges("a").edges(".").edges("b").isGoal()
  end
end