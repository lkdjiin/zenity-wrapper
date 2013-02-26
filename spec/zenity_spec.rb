# -*- encoding: utf-8 -*-

require './spec/helper'

describe Zenity do

  describe "Constants" do
    it "should define ok status" do
      OK.should == 0
    end

    it "should define cancel status" do
      CANCEL.should == 1
    end

    it "should define error status" do
      ERROR.should == -1
    end
  end

    it "should define expired status" do
      EXPIRED.should == 5
    end

end
