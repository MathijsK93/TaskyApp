require 'spec_helper'

describe Task do
  it "has a valid factory" do
    FactoryGirl.create(:task).should be_valid
  end
  
  it "is invalid without a name" do
    FactoryGirl.build(:task, name: nil).should_not be_valid
  end
  
  describe "Validation" do
    let!(:task) { create(:task) }
    it { should validate_presence_of(:name) }
  end
end

