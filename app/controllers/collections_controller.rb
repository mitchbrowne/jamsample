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
    @samples = @current_user.samples
    check_for_collection
  end

  def update
    collection = Collection.find params[:id]
    collection.samples = []
    params[:collection][:sample_ids].each do |sample_id|
      collection.samples << Sample.find(sample_id) unless sample_id.empty? || @current_user.sample_ids.include?(sample_id)
    end

    collection.update collection_params
    redirect_to collection_path
  end

  def destroy
    collection = Collection.find params[:id]
    if collection.samples.present?
      flash[:error] = "Cannot delete collection if collection holds samples."
      redirect_to collection_path
    else
      collection.destroy
      redirect_to collections_path
    end
  end

  def add_sample
    @collection = Collection.find params[:id]
    @samples = @current_user.samples
  end

  private
  def collection_params
    params.require(:collection).permit(:name, :user_id, :sample_ids)
  end
end
