class SamplesController < ApplicationController
  before_action :check_for_login

  def index
    redirect_to user_path(@current_user.id)
  end

  def new_audio
    @sample = Sample.new
  end

  def create_audio
    @sample = Sample.new
    @sample.title = "sample_title"

    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file],
      :resource_type => :video)
      @sample.audio_file = req["public_id"]
    end
    @sample.save
    @current_user.samples << @sample

    redirect_to new_sample_path
  end

  def new
    @genres = Genre.all
    @collections = @current_user.collections

    @sample = @current_user.samples.last
  end

  def create
    @genres = Genre.all
    @collections = @current_user.collections

    @sample = Sample.find params[:id]
    @sample = Sample.update sample_params

    if @current_user.samples.exists?(:title => sample_params[:title])
      flash.now[:error] = "Title already exists."
      render :new
    else
      if params[:file].present?
        req = Cloudinary::Uploader.upload(params[:file])
        @sample.image = req["public_id"]
      end
      @sample.save
      @current_user.samples << @sample
      redirect_to sample_path(@sample)
    end
  end

  def show
    @sample = Sample.find params[:id]
  end

  def edit
    @sample = Sample.find params[:id]
    check_for_sample
    @collections = @current_user.collections
  end

  def update
    @sample = Sample.find params[:id]
    @collections = @current_user.collections


    if @current_user.samples.exists?(:title => sample_params[:title]) && @sample.title != sample_params[:title]
      flash.now[:error] = "Title already exists."
      render :edit
    else
      @sample.update sample_params
      if params[:file].present?
        req = Cloudinary::Uploader.upload(params[:file])
        @sample.image = req["public_id"]
      end
      @sample.genres = []
      unless params[:sample][:genre_ids].nil?
        params[:sample][:genre_ids].each do |genre_id|
          @sample.genres << Genre.find(genre_id) unless genre_id.empty?
        end
      end
      @sample.save

      redirect_to sample_path
    end
  end

  def destroy
    sample = Sample.find params[:id]
    sample.destroy
    redirect_to samples_path
  end

  private
  def sample_params
    params.require(:sample).permit(:title, :sample_type, :collection_id, :genre_ids)
  end
end
