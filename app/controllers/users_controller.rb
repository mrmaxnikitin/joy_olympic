class UsersController < InheritedResources::Base

	def index
		@users=User.all
	end

	def new
	end
	def create
	end

	def edit
	end
	def update
	end

	def destroy
	end

  private
    def user_params
      params.require(:user).permit(:email, :name)
    end
end

