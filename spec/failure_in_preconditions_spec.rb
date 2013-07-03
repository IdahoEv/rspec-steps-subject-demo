require 'spec_helper'

# OUTPUT FROM RUNNING THIS
# [14:46:52 rspec-steps-test (master)]$ rspec spec/failure_in_preconditions_spec.rb
#
# Top 0 slowest examples (0 seconds, 0.0% of total time):
#
# Finished in 0.00028 seconds
# 0 examples, 0 failures


steps "a sequence" do
  before do
    raise "error in before block"
  end

  it "does working thing 1" do
    1.should == 1
  end
  it "does working thing 2" do
    2.should == 2
  end
  it "does failing thing 3" do
    3.should == 1
  end
  it "does failing thing 4" do
    4.should == 1
  end
  it "marks these passed without even running them" do
    puts "This output won't reach console"
  end
end

