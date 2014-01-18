require 'spec_helper'


describe TasksController do
  let(:attributes) { { "name" => "MyString" } }


  describe "GET #index" do
    it "populates an array of tasks" do
      task = FactoryGirl.create(:task)
      get :index
      assigns(:tasks).should eq([task])
    end
    it "renders the index view" do
      get :index
      response.should render_template :index
    end
  end
  
  describe "GET #show" do
    it "assigns the requested task to @task" do
      task = FactoryGirl.create(:task)
      get :show, id: task
      assigns(:task).should eq(task)  
    end
    it "renders the show template" do
      get :show, id: FactoryGirl.create(:task)
      response.should render_template :show
    end
  end
  
  describe "GET #new" do
    it "assings a new Task to @task"
    it "renders the new template"
  end
  
  describe "PUT update" do
    it "assigns the requested task as @task" do
      task = Task.create! name: 'huiswerk maken', completed: true
      put :update, {:id => task.to_param, :task => { name: 'huiswerk maken', completed: true } }
      assigns(:task).should eq(task)
    end
  end
  
  describe "POST create" do
    describe "with valid params" do
      it "creates a new Task" do
        expect {
          post :create, FactoryGirl.create(:task)
        }.to change(Task, :count).by(1)
      end
    end
  end
end
