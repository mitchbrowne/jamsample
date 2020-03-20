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
    @user = User.find params[:id]

    collections = []
    @user.collections.each do |collection|
      collections.append(collection)
    end

    collections.sort_by! {|collection| collection.updated_at}
    @collections = collections.reverse!

    samples = []
    @user.samples.each do |sample|
      samples.append(sample)
    end
    
    samples.sort_by! {|sample| sample.updated_at}
    @samples = samples.reverse!
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user
    if @user.update user_params
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
