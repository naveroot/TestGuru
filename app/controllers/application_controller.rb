# frozen_string_literal: true

class ApplicationController < ActionController::Base

  helper_method :current_user

  private

  def authenticate_user!
    redirect_to login_path, alert: 'Are you realy Guru?' unless current_user
    cookies[:email] = current_user&.email
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
