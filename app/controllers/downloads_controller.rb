class DownloadsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @admin_email = 'ian@gmail.com'
    if @admin_email == 'ian@gmail.com'
      @admin = true
    end   
    @downloads = Download.all
  end

  def new
    @download = Download.new
  end

  def create
    @download = Download.new(download_params)
    
    if @download.save
      redirect_to downloads_path
      @notice = "Download request was successfully created."
    else
      redirect_to downloads_path
      @notice = "Download request was not created."
    end
  end

  def destroy
    Download.find(params[:id]).destroy
    redirect_to downloads_path
  end
  private

  def download_params
    params.require(:download).permit(:title, :file)
  end
end
