class PagesController < ApplicationController


	def index
		@links = Link.paginate(page: params[:page], :per_page => 5)
	end

end
