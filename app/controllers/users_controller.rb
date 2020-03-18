class UsersController < ApplicationController
  before_action :check_for_admin, :only => [:index] # check for admin only on the index page

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = @current_user
    @collections = @user.collections
    @samples = @user.samples
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user
    @user.update user_params
    render :edit
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
