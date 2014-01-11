class Api::TasksController < Api::BaseController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  # before_filter :authenticate_user!
  respond_to :json
  
  def index
    @tasks = Task.all
  end
  
  def show
    render json: @task
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

      if @task.save
        render json: @task, status: :created
      else
        render json: @task.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.json { head :no_content }
      else
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    if @task.destroy
      render json: { message: 'Task deleted', status: :ok}
    end
  end
    
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :completed)
    end
end
