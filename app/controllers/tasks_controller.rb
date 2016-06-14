class TasksController < ApplicationController

	def create
    @contest = Contest.find(params[:contest_id])
    @task = @contest.tasks.create(task_params)
    redirect_to participate_contest_path(@contest)
  end

	private
    def task_params
      params.require(:task).permit(:text, :var1, :var2, :var3, :var4, :answer, :image, :background_color)
    end
end