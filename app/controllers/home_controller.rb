class HomeController < ApplicationController
  def index
    @user = session[:userinfo]
  end

  def show
    @user = session[:userinfo]
  end

  def about
  end
end