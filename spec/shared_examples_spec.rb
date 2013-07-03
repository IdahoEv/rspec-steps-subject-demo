require 'spec_helper'


describe "fixtures behavior" do

  def increment_fixture_run_count
    puts "incrementing"
    if @fixture_run_count
      @fixture_run_count += 1
    else
      @fixture_run_count = 1
    end
  end

  shared_examples "steps with subject" do
    before :each do
      :stuff
    end
    it "should stuff" do
      :stuff.should == :stuff
    end

    steps do
      subject { puts 'regenerating subject'; increment_fixture_run_count }
      it{ should == 1 }
      it{ should == 1 }
      it{ should == 1 }
      it "explicitly called" do
        subject.should == 1
      end
      it "explicitly incremented" do
        increment_fixture_run_count.should == 2
      end
    end
  end

  describe "stuff" do
    before :each do
      :stuff
    end
    include_examples "steps with subject"
  end


end


