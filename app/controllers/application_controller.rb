class ApplicationController < ActionController::Base
  before_action :fetch_user

  private
  def fetch_user
    @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
    session[:user_id] = nil unless @current_user.present?
  end

  def check_for_login
    redirect_to login_path unless @current_user.present?
  end

  def check_for_admin
    redirect_to root_path unless @current_user.present? && @current_user.admin?
  end

  def check_for_collection # checks if user owns collection
    redirect_to collections_path unless @current_user.collections.include?(@collection)
  end

  def check_for_sample # checks if user owns sample
    redirect_to samples_path unless @current_user.samples.include?(@sample)
  end
end
