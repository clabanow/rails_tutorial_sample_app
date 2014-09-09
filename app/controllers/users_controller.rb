class UsersController < ApplicationController
  # this defines what to run before certain actions are called
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

	def show 
		@user = User.find(params[:id])
    @title = @user.name
	end

  def new
  	@title = "Sign up"
    @user = User.new
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def edit 
    @title = "Edit user"
  end 

  def update
    # uses strong parameters to prevent mass assignment vulnerability (user_params)
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated!"
      redirect_to @user
    else
      render 'edit'
    end
  end 

  def index
    @title = 'All users'
    @users = User.paginate(page: params[:page])
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # before filters

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    # def signed_in_user
    #   unless signed_in?
    #     flash[:notice] = 'Please sign in.'
    #     redirect_to signin_url
    #   end
    # end
end
