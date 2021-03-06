class ArticlesController < ApplicationController

before_action :signed_in_user, only: [:edit, :update, :destroy]

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)

		if @article.save
			redirect_to @article
		else
			flash.now[:notice] = 'Please fill out all the fields.'
			render 'new'
		end
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end

	def index
		@articles = Article.all.paginate(page: params[:page], per_page: 6)
	end

	def show
		@article = Article.find(params[:id])
	end



private

	def article_params
		params.require(:article).permit(:title, :region, :text, :image, :originallink, :country)
	end

		def signed_in_user
			unless signed_in?
				store_location
				redirect_to admin_url, notice: "Please sign in." unless signed_in?
			end
		end

end
