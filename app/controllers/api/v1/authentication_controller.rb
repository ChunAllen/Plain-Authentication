class Api::V1::AuthenticationController < ApiController

  def sign_in
    begin
      @user = User.find_by(email: params[:email])
      if @user && @user.password == params[:password]
        success_message
      else
        error_response
      end
    rescue
      error_response
    end
  end

  def sign_up

  end

  private

  def success_message
    render json: { user: @user }, status: 200
  end

  def error_response
    render json: { error: "Invalid email or password" }, status: 403
  end

end
