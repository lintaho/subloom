class UsersController < ApplicationController

	def show
	end
	
	def photogs_index
		@users = User.where(:role => "photog").paginate(page: params[:page])
		@title = "Photographer Directory"
	end

	def following
		@title = "Following"
		@user = User.find(params[:id])
		@users = @user.followed_users.paginate(page: params[:page])
		render 'show_follow'
	end

	def followers
		@title = "Followers"
		@user = User.find(params[:id])
		@users = @user.followers.paginate(page: params[:page])
		render 'show_follow'
	end

end