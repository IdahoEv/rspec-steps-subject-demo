require 'spec_helper'


describe "fixtures behavior" do

  def increment_fixture_run_count
    if @fixture_run_count
      @fixture_run_count += 1
    else
      @fixture_run_count = 1
    end
  end

  describe "without rspec-steps" do
    before do
      increment_fixture_run_count
    end
    it "runs once" do; increment_fixture_run_count; end
    it "runs twice" do; increment_fixture_run_count; end
    it "runs thrice" do; increment_fixture_run_count; end
    it "should have incremented ivar once" do
      @fixture_run_count.should == 1
    end
  end

  steps "with rspec-steps" do
    before do
      increment_fixture_run_count
    end
    it "runs once" do; increment_fixture_run_count.should == 2; end
    it "runs twice" do; increment_fixture_run_count.should == 3; end
    it "runs thrice" do; increment_fixture_run_count.should == 4; end
    it "should have incremented ivar four times" do
      @fixture_run_count.should == 4
    end
  end

  steps "with rspec-steps and a subject" do
    subject do
      puts "running subject, ivar is #{@fixture_run_count}"
      increment_fixture_run_count
      @fixture_run_count
    end
    it { should == 1 }
    it { should == 2 } # fails here; subject is 1, not 2 ... vars have reset perhaps
    it { should == 3 }
    it "should have incremented ivar four times" do
      @fixture_run_count.should == 4
    end
  end
end

