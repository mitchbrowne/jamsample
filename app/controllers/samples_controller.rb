class SamplesController < ApplicationController
  before_action :check_for_login

  def index
    @samples = @current_user.samples
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
    @collections = @current_user.collections
  end

  def update
    sample = Sample.find params[:id]
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
    params.require(:sample).permit(:title, :audio_file, :image, :sample_type, :collection_id)
  end
end
