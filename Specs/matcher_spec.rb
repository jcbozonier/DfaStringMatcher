require "spec"
require "../Source/matcher"

describe "When matching a multiletter string with a match using a period" do
  before do
    @theMatcher = StringMatcher.new()
  end

  it "should_match" do
    true.should == @theMatcher.match("a.c", "abc")  
  end
end

describe "When matching a letter with a period" do
  before do
    @theMatcher = StringMatcher.new()
  end

  it "should match" do
    true.should == @theMatcher.match(".", "a")
  end
end

describe "When matching a letter with a different letter" do
  before do
    @theMatcher = StringMatcher.new()
  end

  it "should NOT match" do
    #To change this template use File | Settings | File Templates.
    false.should == @theMatcher.match("a", "b")
  end
end

describe "When matching a letter with the same letter" do
  before do
    @theMatcher = StringMatcher.new()
  end
  
  it "should match" do
    #To change this template use File | Settings | File Templates.
    true.should == @theMatcher.match("a", "a")
  end
end