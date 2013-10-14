class LinksController < ApplicationController
	before_filter :authenticate_user!, :only =>[:new, :create]

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
			redirect_to @link
		else
			render 'new'
		end
	end
	
	private
		def link_params
			params.require(:link).permit(:title, :url, :user_id)
		end

end