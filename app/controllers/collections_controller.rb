class CollectionsController < ApplicationController
  before_action :check_for_login

  def new
    @collection = Collection.new
  end

  def show
  end

  def index
    @collections = @current_user.collections
  end

  def edit
  end
end
