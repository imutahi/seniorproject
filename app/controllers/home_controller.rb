class HomeController < ApplicationController
  def index
    @user = session[:userinfo]
  end

  def show
    @user = session[:userinfo]
  end

  def about
    @user = session[:userinfo]
  end
end