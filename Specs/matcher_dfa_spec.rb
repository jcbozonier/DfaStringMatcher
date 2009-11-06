require "spec"
require "../Source/matcherdfa"

describe "When parsing a string of literals" do
  before do                               
    @dfaBuilder = MatcherDfa.new("a.b")
  end

  it "should create a graph node for each literal" do
      
  end
end