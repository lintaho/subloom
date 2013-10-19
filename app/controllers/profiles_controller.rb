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
		if @profile.update_attributes(prof_params)
			flash[:notice] = "Profile updated"
			redirect_to @profile
		else
			render 'edit'
		end
	end

	def show
		# debugger
		@profile = Profile.find(params[:id])
		if current_user.role == "photog"
			render 'show_photog'
		end
	end

	def show_photog
		@profile = Profile.find(params[:id])
	end

	private
		def prof_params
			params.require(:profile).permit!
		end
		
end
