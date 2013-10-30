class SaveRelationshipsController < ApplicationController
	before_action :authenticate_user!
	
	def create
		@link = Link.find(params[:link_id])
		current_user.save_link!(@link)
		respond_to do |format|
			format.html { redirect_to root_url }
			format.js
		end
	end

	def destroy
		@link = SaveRelationship.find(params[:id]).link
		current_user.unsave_link!(@link)
		respond_to do |format|
			format.html {redirect_to root_url}
			format.js
		end
	end
end