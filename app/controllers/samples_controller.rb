class SamplesController < ApplicationController
  before_action :check_for_login

  def new
    @sample = Sample.new
  end

  def create
    
  end

  def show
  end

  def index
    @samples = @current_user.samples
  end

  def edit
  end
end
