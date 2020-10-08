class PagesController < ApplicationController
	before_action :set_page, only: [:show, :edit, :update, :destroy]
	#before_action :set_page, except: [:index, :new, :create]

	def index
		@pages = Page.all
	end
	
	def show
		set_page
		###@page = Page.find(params[:id])
		#render text: @page.title	
	###rescue ActiveRecord::RecordNotFound
		###flash[:notice] = "We couldn't find that Page."
		###redirect_to action: :index
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