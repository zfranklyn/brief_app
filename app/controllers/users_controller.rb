class UsersController < ApplicationController
	http_basic_authenticate_with name: "pascal", password: "krummenacher", 
	only: [:create]

before_action :signed_in_user, only: [:edit, :update, :show, :destroy]


	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new(params[:id])
		if @user.save

		else
			render 'new'
		end
	end

	def create
		@user = User.new(user_params)
		if @user.save
			sign_in @user
			redirect_to root_url
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			flash[:success] = "User updated"
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
	    User.find(params[:id]).destroy
	    flash[:success] = "User deleted."
	    redirect_to users_url
  	end


	private

		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

		def signed_in_user
			unless signed_in?
				store_location
				redirect_to signin_url, notice: "Please sign in." unless signed_in?
			end
		end

end
