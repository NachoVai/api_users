class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private
  
  def respond_with(resource, _opts = {})
    render json: {
      status: { code: 200, message: 'Signed in successfully.' },
      data: resource
    }, status: :ok
  end

  def respond_to_on_destroy
    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ').last, Rails.application.credentials.fetch(:secret_key_base)).first
    current_user = User.find(jwt_payload['sub'])

    if current_user
      render json: {
        status: { code: 200, message: 'Signed out successfully baby.' }
      }, status: :ok
    else
      render json: {
        status: { code: 401, message: 'User has no active session' }
      }, status: :unauthorized
    end
  end
end