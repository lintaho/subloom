class SaveRelationshipsController < ApplicationController
	before_action :authenticate_user!
	
	def create
		# debugger
		@link = Link.find(params[:save_relationship][:link_id])
		current_user.save_link!(@link)
		respond_to do |format|
			format.html { redirect_to root_url }
			format.js
		end
		# else
		# 	flash[:error] = 'Sign in' #better way to auth?
		# 	redirect_to new_user_session_path
		# end
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