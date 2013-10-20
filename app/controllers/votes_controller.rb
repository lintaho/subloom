class VotesController < ApplicationController
	before_filter :authenticate_user!, :only =>[:create]

	def create
		@vote = current_user.votes.create(vote_params)
		@link = @vote.link
		if @vote.save
			respond_to do |format|
				format.html { redirect_to :back }
				format.js
			end
		else
			flash[:error] = 'failed vote'
			redirect_to :back
		end
	end

	#currently passing in a current_user_id, kind of hacky should fix
	def destroy
		@vote = Vote.find_by(vote_params)
		if @vote
			@link = @vote.link
			if @vote.destroy
				respond_to do |format|
					format.html {redirect_to :back}
					format.js
				end
			else
				flash[:error] = 'failed vote'
				redirect_to :back
			end
		end
	end

	private
		def vote_params
			params.require(:vote).permit(:link_id)
		end
end
