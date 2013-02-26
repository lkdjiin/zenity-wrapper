# -*- encoding: utf-8 -*-

require './spec/helper'

describe Message do

  describe "method" do
    before :all do
      @obj = Message.new(:info, "text")
    end

    subject { @obj }
    it { should respond_to :get_command }
    it { should respond_to :proceed }
    it { should respond_to :title= }
    it { should respond_to :width= }
    it { should respond_to :height= }
  end

  it "should create an error message" do
    obj = Message.new(:error, "This is a message")
    expected = %q{zenity --error --text="This is a message"}
    obj.get_command.should == expected
  end

  it "should create an info message" do
    obj = Message.new(:info, "This is a message")
    expected = %q{zenity --info --text="This is a message"}
    obj.get_command.should == expected
  end

  it "should create an warning message" do
    obj = Message.new(:warning, "This is a message")
    expected = %q{zenity --warning --text="This is a message"}
    obj.get_command.should == expected
  end

  it "should create an question message" do
    obj = Message.new(:question, "This is a message")
    expected = %q{zenity --question --text="This is a message"}
    obj.get_command.should == expected
  end

  it "should not allow unknown message type" do
    lambda{Message.new(:foo, "This is a message") }.should raise_error
  end

  it "should allow the title option" do
    obj = Message.new(:info, "a")
    obj.title = "my title"
    expected = %q{zenity --info --text="a" --title="my title" }
    obj.get_command.should == expected
  end

  it "should allow the width option" do
    obj = Message.new(:info, "a")
    obj.width = 400
    expected = %q{zenity --info --text="a" --width="400" }
    obj.get_command.should == expected
  end

  it "should allow the height option" do
    obj = Message.new(:info, "a")
    obj.height = 400
    expected = %q{zenity --info --text="a" --height="400" }
    obj.get_command.should == expected
  end

end
