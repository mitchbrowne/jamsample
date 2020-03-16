class CollectionsController < ApplicationController
  before_action :check_for_login

  def new
    @collection = Collection.new
  end

  def create
    collection = Collection.create collection_params
    @current_user.collections << collection
    redirect_to collections_path
  end

  def show
    @collection = Collection.find params[:id]
  end

  def index
    @collections = @current_user.collections
  end

  def edit
  end

  private
  def collection_params
    params.require(:collection).permit(:name, :user_id)
  end
end
