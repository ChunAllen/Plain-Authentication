class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: permitted_params[:email])
    if user && user.password == permitted_params[:password]
      session[:user_id] = user.id
      redirect_to root_path, flash: { success: "Authentication Successful" }
    else
      flash.now[:error] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path, flash: { success: "Sign Out user" }
  end

  private

  def permitted_params
    params.permit(:email, :password)
  end

end
