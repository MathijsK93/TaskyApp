require 'spec_helper'

describe Api::TasksController do
  
  describe "GET index" do
    it 'sends a list of tasks' do
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
  
  describe "DELETE destroy" do
    it "deletes the task" do
      task = FactoryGirl.create(:task)
      expect{
        delete :destroy, id: task
      }.to change(Task, :count).by(-1)
    end
  end
  
  describe "POST create" do
    it "creates a new task" do
      expect {
        post :create, { task: { name: 'test', completed: true } }
      }.to change(Task, :count).by(1)
    end
    
    it "should return 201 status code" do
      FactoryGirl.create(:task)
      expect(response).to be_success
    end    
  end
end