class SamplesController < ApplicationController
  before_action :check_for_login

  def index
    @samples = @current_user.samples
  end

  def new
    @sample = Sample.new
    @collections = @current_user.collections
  end

  def create
    sample = Sample.create sample_params
    redirect_to samples_path
  end

  def show
  end

  def edit
  end

  def destroy

  end

  private
  def sample_params
    params.require(:sample).permit(:title, :audio_file, :image, :sample_type, :collection_id)
  end
end
