class PagesController < ApplicationController
	
	def about
	end
	
	def contact
	end

	def index
		@links = Link.paginate(page: params[:page], :per_page => 12)
	end

end
