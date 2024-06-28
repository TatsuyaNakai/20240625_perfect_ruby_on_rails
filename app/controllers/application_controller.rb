class ApplicationController < ActionController::Base
  helper_method %i[logged_in? current_user]

  before_action :authenticate

  private

  def logged_in?
    !!session[:user_id]
  end

  def authenticate
    return if logged_in?
    
    redirect_to root_path, alert: 'ログインしてください'
  end

  def current_user
    User.find(session[:user_id])
  end
end
