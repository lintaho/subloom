class LinksController < ApplicationController
	before_filter :authenticate_user!, :only =>[:new, :create, :destroy]
	load_and_authorize_resource
	
	def index
	end

	def show
		@link = Link.find(params[:id])
	end

	def new
		@link = Link.new
	end

	def create
		@link = current_user.links.new(link_params)
		if @link.save
			flash[:notice] = "Link submitted!"
			redirect_to root_url
		else
			render 'new'
		end
	end

	def destroy
		# debugger
		@link = Link.find(params[:id])
		if @link.destroy
			flash[:notice] = "Post deleted!"
			redirect_to profile_path(current_user.profile)
		else
			flash[:alert] = "Post deletion failed."
			redirect_to profile_path(current_user.profile)
		end
	end
	

	private
		def link_params
			params.require(:link).permit!
		end

end
