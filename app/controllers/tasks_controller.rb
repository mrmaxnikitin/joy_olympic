class TasksController < ApplicationController
  before_action :require_admin, only: [:new, :create]

  def new
    @task = Task.new
  end

	def create
    @task = Task.new task_params
    if @task.save
      flash[:success] = "Успех"
      redirect_to new_task_path
    else
      flash[:error] = "Хммм... Попробуйте еще раз!"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @task.update_attributes tasks_params
      redirect_to task_path
    else
      render 'edit'
    end
  end

  def index
  	@tasks = Task.all
    render :index, formats: :json
  end

  def show
  end

	private
    def task_params
      params.require(:task).permit(:contest_id, :classroom, :text, :var1, :var2, :var3, :var4, :answer, :image, :background_color)
    end
end