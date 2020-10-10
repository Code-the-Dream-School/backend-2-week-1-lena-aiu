class PagesController < ApplicationController
	#before_action :set_page, only: [:show, :edit, :update, :destroy]
	before_action :set_page, only: [:edit, :update, :destroy]
	#before_action :set_page, except: [:index, :new, :create]
	rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
	

	def index
		@pages = Page.all
	end
	
	def catch_not_found 
		render text: 'We could not find that Page!'
	end
	
	def show
		begin
		set_page
	rescue ActiveRecord::RecordNotFound
		redirect_to @page
		return
		end
	end
	
	def new
		@page = Page.new
	end

	def create
		#page_params = params.require(:page).permit(:title, :body, :slug)
		@page = Page.new(page_params)
		@page.save
		redirect_to @page
	end
	
	def edit
		logger.info("The :page parameter is: #{params[:id]}")
		set_page
		#@page = Page.find(params[:id])
	end
	def update
		set_page
		#@page = Page.find(params[:id])
		#page_params = params.require(:page).permit(:title, :body, :slug)
		@page.update(page_params)
		redirect_to @page
	end
	
	def destroy
		set_page
		#@page = Page.find(params[:id])
		@page.destroy
		redirect_to pages_path
	end
	
	private
	
		def page_params
			params.require(:page).permit(:title, :body, :slug)
		end
		
		def set_page
			@page = Page.find(params[:id])
		end
end