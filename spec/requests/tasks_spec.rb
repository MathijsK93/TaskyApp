require 'spec_helper'

describe "Tasks" do
  describe "GET /tasks" do
    it "should give a 200 status code" do
      get tasks_path
      response.status.should be(200)
    end
  end
  
  describe "GET /tasks" do
    it "should give a 200 status code" do
      get tasks_path
      response.status.should be(200)
    end
  end  
end
