class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }


  helper_method :current_user

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  private

  def authenticate_user
    unless session[:user_id].present?
      redirect_to new_session_path
    end
  end


end
