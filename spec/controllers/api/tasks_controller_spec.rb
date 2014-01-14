require 'spec_helper'

describe Api::TasksController do
  
  describe "GET index" do
    it 'sends a list of messages' do
      FactoryGirl.create_list(:task, 10)

      get :index

      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json.length).to eq(10)
    end
  end
  
  describe "GET show" do
    it "retrieves a specific task" do
      task = FactoryGirl.create(:task)
      get :show, id: task
      
      expect(response).to be_succes
      json = JSON.parse(response.body)
      expect(json['name']).to eq(task.name)
    end
  end
end