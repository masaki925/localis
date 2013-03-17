class LoginsController < ApplicationController
  def index
  end

  def login
    session[:user_id] = params[:user_id]
    redirect_to requests_path
  end

  def logout
    reset_session
    redirect_to logins_path
  end
end
