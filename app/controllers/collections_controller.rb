class CollectionsController < ApplicationController
  before_action :check_for_login

  def new
    @collection = Collection.new
  end

  def create
    collection = Collection.create collection_params
    @current_user.collections << collection
    redirect_to collection_path(collection)
  end

  def show
    @collection = Collection.find params[:id]
  end

  def index
    @collections = @current_user.collections
  end

  def edit
    @collection = Collection.find params[:id]
  end

  def update
    collection = Collection.find params[:id]
    collection.update collection_params
    redirect_to collection_path
  end

  def destroy
    flash.now[:notice] = "YOOO"
    collection = Collection.find params[:id]
    if collection.samples.present?
      flash[:error] = "Cannot delete collection if collection holds samples."
      # flash.now[:notice] = "Cannot delete collection while collection holds samples"
      redirect_to collection_path
    else
      flash.alert = "you"
      collection.destroy
      redirect_to collections_path
    end

  end

  private
  def collection_params
    params.require(:collection).permit(:name, :user_id)
  end
end
