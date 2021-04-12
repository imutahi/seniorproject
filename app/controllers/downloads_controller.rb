class DownloadsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @downloads = Download.all
    @admin = "talontest7@gmail.com"
    #@admin_email = 'ian@gmail.com'
    #if @admin_email == 'ian@gmail.com'
    #  @admin = true
    #end
  end

  def new
    if curr_user_is_admin?
      @download = Download.new
    else
      redirect_to '/'
    end
  end

  def create
    if curr_user_is_admin?
      @download = Download.new(download_params)
      
      if @download.save
        redirect_to downloads_path
        @notice = "Download request was successfully created."
      else
        redirect_to downloads_path
        @notice = "Download request was not created."
      end
    else 
      redirect_to '/'
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
