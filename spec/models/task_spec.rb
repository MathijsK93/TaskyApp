require 'spec_helper'

describe Task do
  describe "Validation" do
  
    it "has a valid factory" do
      FactoryGirl.create(:task).should be_valid
    end
  
    it "is invalid without a name" do
      FactoryGirl.build(:task, name: nil).should_not be_valid
    end
  
    it "should validate" do
      let!(:task) { create(:task) }
      it { should validate_presence_of(:name) }
    end
  end
end

