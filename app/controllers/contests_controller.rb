class ContestsController < ApplicationController
	before_action :find_contest, except: [:index, :new, :create]

	def index
		@contests = Contest.all
	end

	def show
	end

	def new
		@contest = Contest.new
	end

	def create
		@contest = Contest.new contest_params
    if @contest.save
      redirect_to contests_path
    else
      render 'new'
    end
	end

	def edit
	end

	def update
    if @contest.update_attributes contest_params
      redirect_to contest_path
    else
      render 'edit'
    end
	end

	def destroy
		@contest.destroy
    redirect_to contests_path
	end

	def participate
		@tasks = @contest.tasks.all
	end

	private
    def find_contest
      @contest = Contest.find(params[:id])
    end

    def contest_params
      params.require(:contest).permit(:title, :description,
        :category, :age, :image, :reward_number)
    end
end
