class RewardsController < ApplicationController
	before_action :find_reward, except: [:index, :new, :create]

	def index
		@rewards = Reward.order(created_at: "DESC").all
	end

	def show
    image = MiniMagick::Image.open("./public/original_diplomas/diploma.jpg")
    image.resize "2555x3302"
    image.format "png"
    image.combine_options do |c|
      c.gravity 'Center Top'
      c.pointsize '72'
      c.draw "text 0,0 'Ruby Ruby RubyRubyRubyRubyRubyRubyRubyRuby'"
      c.fill 'blue'
    end
    image.write "./public/diplomas/heartqqq.png"
	end

	def create
		if logged_in?
    	@reward = current_user.rewards.create reward_params
    else
    	@reward = Reward.create reward_params
    end
    render nothing: true
  end

	private
    def reward_params
      params.require(:reward).permit(
        :name, :age, :institution, :prize, :score, :contest_id)
    end

    def find_reward
      @reward = Reward.find(params[:id])
    end
end
