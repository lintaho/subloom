class VotesController < ApplicationController
	before_filter :authenticate_user!, :only =>[:create]

	def create
		@vote = current_user.votes.create(vote_params)
		if @vote.save
			redirect_to :back
		else
			flash[:error] = 'failed vote'
			redirect_to :back
		end
	end

	private
		def vote_params
			params.require(:vote).permit(:link_id)
		end
end
