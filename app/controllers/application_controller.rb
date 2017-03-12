class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :ensure_current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def ensure_current_user
    if !current_user
      flash[:alert] = "You must sign in"
      redirect_to sign_in_path
    end
  end
end
