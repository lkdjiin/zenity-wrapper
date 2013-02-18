# -*- encoding: utf-8 -*-

require './spec/helper'

describe List do

  describe "method" do
    before :all do
      @obj = List.new()
    end

    subject { @obj }
    it { should respond_to :get_command }
    it { should respond_to :proceed }
    it { should respond_to :title= }
    it { should respond_to :separator= }
    it { should respond_to :print_column= }
  end

  it "should work" do
    obj = List.new(columns = ["a", "b"], data = ['"1" "2"', '"3" "4"'])
    expected = %q{zenity --list \
--column="a" --column="b" \
"1" "2" \
"3" "4"}
    obj.get_command.should == expected
  end

  it "should allow binary options" do
    obj = List.new(["a", "b"], ["TRUE 1", "FALSE 2"], ['checklist'])
    expected = %q{zenity --list \
--checklist \
--column="a" --column="b" \
TRUE 1 \
FALSE 2}
    obj.get_command.should == expected
  end

  it "should reject unknown options" do
    lambda {List.new(["a", "b"], ["TRUE", "2"], ['check'])}.should raise_error
  end

  it "should allow to set the --print-column option" do
    obj = List.new(columns = ["a", "b"], data = ['"1" "2"', '"3" "4"'])
    obj.print_column = "ALL"
    expected = %q{zenity --list \
--column="a" --column="b" \
"1" "2" \
"3" "4" --print-column=ALL }
    obj.get_command.should == expected
  end

  it "should allow to set the --separator option" do
    obj = List.new(columns = ["a", "b"], data = ['"1" "2"', '"3" "4"'])
    obj.separator = "*"
    expected = %q{zenity --list \
--column="a" --column="b" \
"1" "2" \
"3" "4" --separator=* }
    obj.get_command.should == expected
  end
end
