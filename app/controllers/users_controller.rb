class UsersController < ApplicationController
before_action :signed_in_user, only: [:edit, :update]


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
