class ProfilesController < ApplicationController
	before_action :authenticate_user!, :only => [:edit, :update]

	def index
	end

	def new
	end

	def create
	end

	def edit
		@profile = Profile.find(params[:id])
	end

	def destroy
	end

	def update

		@profile = Profile.find(params[:id])
		if current_user != @profile.user
			flash[:error] = "You are not authorized to do that"
			redirect_to @profile
		else
			if @profile.update_attributes(prof_params)
				flash[:notice] = "Profile updated"
				redirect_to @profile
			else
				render 'edit'
			end
		end
	end

	def show
		# debugger
		@profile = Profile.find(params[:id])
		@user = @profile.user
		@links = @user.links
		# debugger
		if @user.role == "photog"
			render 'show_photog'
		end
	end

	def show_photog
		@profile = Profile.find(params[:id])
		@user = @profile.user

	end

	private
		def prof_params
			params.require(:profile).permit!
		end
		
end
