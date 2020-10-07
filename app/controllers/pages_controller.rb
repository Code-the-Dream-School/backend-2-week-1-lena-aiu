class PagesController < ApplicationController
	def index
		@pages = Page.all
	end
	
	def show
		@page = Page.find(params[:id])
		#render text: @page.title	
	end
end
