class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, options={})
     
      render json: {
        status: { code: 200, message: 'Signed up successfully :).' },
        data: resource
      }, status: :ok
    else
      render json: {
        status: { code: 422, message: 'Something went wrong.', 
                  errors: resource.errors.full_messages }
      }, status: :unprocessable_entity
    end
  end
end
