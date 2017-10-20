class StaticPagesController < ApplicationController
	def welcome
		@contests = Contest.where(targetAudience: "school")
		@precontests = Contest.where(targetAudience: "preschool")
	end
end
