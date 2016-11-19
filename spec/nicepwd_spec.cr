require "./spec_helper"

describe Nicepwd do
  describe "::Formatter" do
    describe ".new" do
      it "should not raise an error" do
        begin
          Nicepwd::Formatter.new
        rescue err
          err.should be_nil
        end
      end
    end

    describe ".new(home : String)" do
      it "should not raise an error" do
        begin
          Nicepwd::Formatter.new("/home/user")
        rescue err
          err.should be_nil
        end
      end
    end

    describe ".format(str)" do
      it "should not raise an error" do
        begin
          formatter = Nicepwd::Formatter.new
          formatter.format("/home/tester/Documents")
        rescue err
          err.should be_nil
        end
      end

      it "should replace user's default home dir with '~'" do
        formatter = Nicepwd::Formatter.new
        formatter.format("/home/tester/Documents").should eq "~/Documents"
      end

      it "should replace not default user's home dir with '~'" do
        formatter = Nicepwd::Formatter.new("/home/user")
        formatter.format("/home/user/Documents").should eq "~/Documents"
      end

      it "should no replace not user's home dir with '~'" do
        formatter = Nicepwd::Formatter.new
        formatter.format("/home/otheruser/Documents").should eq "/h/o/Documents"
      end

      it "should no replace not user's home dir with '~', when home is not default" do
        formatter = Nicepwd::Formatter.new("/home/user")
        formatter.format("/home/tester/Documents").should eq "/h/t/Documents"
      end

      it "should pick only first char of parents dirnames" do
        formatter = Nicepwd::Formatter.new
        formatter.format("/home/tester/Documents/job/outsource/deep/document").should eq "~/D/j/o/d/document"
        formatter.format("/home/user/Documents/job/outsource/deep/document").should eq "/h/u/D/j/o/d/document"
      end
    end
  end
end
