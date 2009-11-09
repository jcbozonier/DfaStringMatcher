# To change this template, choose Tools | Templates
# and open the template in the editor.
require 'string_matcher'

describe "When matching a.c*z with abcdefghzq" do
  before(:each) do
    @string_matcher = StringMatcher.new
    @result = @string_matcher.is_match("a.c*z", "abcdefghzq")
  end

  it "should NOT match" do
    @result.should == false
  end
end

describe "When matching a.c*z with abcdefghz" do
  before(:each) do
    @string_matcher = StringMatcher.new
    @result = @string_matcher.is_match("a.c*z", "abcdefghz")
  end

  it "should match" do
    @result.should == true
  end
end

describe "When matching z.c with abc" do
  before(:each) do
    @string_matcher = StringMatcher.new
    @result = @string_matcher.is_match("z.c", "abc")
  end

  it "should NOT match" do
    @result.should == false
  end
end

describe "When matching a.c with abc" do
  before(:each) do
    @string_matcher = StringMatcher.new
    @result = @string_matcher.is_match("a.c", "abc")
  end

  it "should match" do
    @result.should == true
  end
end

describe "When matching a with b" do
  before(:each) do
    @string_matcher = StringMatcher.new
    @result = @string_matcher.is_match("a", "b")
  end

  it "should NOT match" do
    @result.should == false
  end
end

describe "When matching a with a" do
  before(:each) do
    @string_matcher = StringMatcher.new
    @result = @string_matcher.is_match("a", "a")
  end

  it "should match" do
    @result.should == true
  end
end

