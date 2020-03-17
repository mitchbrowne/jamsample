class CollectionsController < ApplicationController
  before_action :check_for_login

  def new
    @collection = Collection.new
    @samples = @current_user.samples
  end

  def create
    @samples = @current_user.samples
    @collection = Collection.new collection_params

    if @current_user.collections.exists?(:name => collection_params[:name])
      flash.now[:error] = "Name already exists."
      render :new
    else
      @current_user.collections << @collection
      @collection.samples = []
      unless params[:collection][:sample_ids].nil?
        params[:collection][:sample_ids].each do |sample_id|
          @collection.samples << Sample.find(sample_id) unless sample_id.empty? || @current_user.sample_ids.include?(sample_id)
        end
      end
      @collection.save
      redirect_to collection_path(@collection)
    end
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
    @collection = Collection.find params[:id]
    @samples = @current_user.samples

    if @current_user.collections.exists?(:name => collection_params[:name]) && @collection.name != collection_params[:name]
      flash.now[:error] = "Name already exists."
      render :edit
    else
      @collection.samples = []
      unless params[:collection][:sample_ids].nil?
        params[:collection][:sample_ids].each do |sample_id|
          @collection.samples << Sample.find(sample_id) unless sample_id.empty? || @current_user.sample_ids.include?(sample_id)
        end
      end
      @collection.update collection_params
      redirect_to collection_path
    end
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

  private
  def collection_params
    params.require(:collection).permit(:name, :user_id, :sample_ids)
  end
end
