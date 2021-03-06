class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def create_session
    session[:user] ||= User.create!(ip: request.ip).id
  end

  def current_user
    User.find(session[:user])
  end

end
