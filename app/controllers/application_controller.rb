class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :ensure_current_user

  helper_method :current_user, :regular_play_rounds, :semi_final_rounds, :final_rounds

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def disable_nav
    @disable_nav = true
  end

  def ensure_current_user
    if !current_user
      flash[:alert] = "You must sign in"
      redirect_to sign_in_path
    end
  end

  def regular_play_rounds
    @regular_play_rounds ||= Round.regular_play_rounds
  end

  def semi_final_rounds
    @semi_final_rounds ||= Round.semi_final_rounds
  end

  def final_rounds
    @final_rounds ||= Round.final_rounds
  end
end
