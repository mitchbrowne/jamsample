class SamplesController < ApplicationController
  before_action :check_for_login

  def index
    @samples = @current_user.samples.order(:created_at)
  end

  def new
    @sample = Sample.new
    @genres = Genre.all
    @collections = @current_user.collections
  end

  def create
    sample = Sample.create sample_params
    redirect_to samples_path
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
    sample = Sample.find params[:id]
    sample.genres = []
    params[:sample][:genre_ids].each do |genre_id|
      sample.genres << Genre.find(genre_id) unless genre_id.empty?
    end
    sample.update sample_params

    redirect_to sample_path
  end

  def destroy
    sample = Sample.find params[:id]
    sample.destroy
    redirect_to samples_path
  end

  private
  def sample_params
    params.require(:sample).permit(:title, :audio_file, :image, :sample_type, :collection_id, :genre_ids)
  end
end
