require 'Source/string_reader'

alias running lambda

describe "When reading each character in string" do
  before(:each) do
    @string_reader = StringReader.new("abc")
    @my_result = ""
    @string_reader.read_each do |character|
      @my_result << character
    end
  end

  it "should iterate through each character in the correct order" do
    @my_result.should == "abc"
  end
end

describe "When reading past last character in the string" do
  before(:each) do
    @string_reader = StringReader.new("ab")
    @string_reader.read
    @string_reader.read
  end

  it "should asplode!" do
    running{@string_reader.read}.should raise_error
  end
end

describe "When peeking after reading last character in the string" do
  before(:each) do
    @string_reader = StringReader.new("ab")
    @string_reader.read
    @string_reader.read
    @peeked_string = @string_reader.peek
  end

  it "should return None" do
    @peeked_string.should == nil
  end
end

describe "When reading last character in the string" do
  before(:each) do
    @string_reader = StringReader.new("ab")
    @string_reader.read
    @string_reader.read
  end

  it "should detect end of string" do
    @string_reader.end_of_string.should == true
  end
end

describe "When read from twice the StringReader" do
  before(:each) do
    @string_reader = StringReader.new("ab")
    @first_read_string = @string_reader.read
    @second_read_string = @string_reader.read
  end

  it "should return two different characters" do
    @first_read_string.should_not == @second_read_string
  end
end

describe "When peeking from a multiletter string the StringReader" do
  before(:each) do
    @string_reader = StringReader.new("ab")
    @peeked_string = @string_reader.peek
  end

  it "should return only a single character" do
    @peeked_string.length.should == 1
  end

  it "should match the first letter of the string" do
    @peeked_string.should == "a"
  end
end

describe "When StringReader is read from the string read" do
  before(:each) do
    @string_reader = StringReader.new("a")
    @peeked_string = @string_reader.peek
    @read_string = @string_reader.read
  end

  it "should be the peeked string" do
    @read_string.should == @peeked_string
  end
end

describe "When StringReader is initialized and peeked" do
  before(:each) do
    @string_reader = StringReader.new("a")
    @peeked_string = @string_reader.peek
  end

  it "should return the first character in the read string" do
    @peeked_string.should == "a"
  end
end