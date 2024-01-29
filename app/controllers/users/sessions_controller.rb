class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(_resource, _opts = {})
    render json: {
      message: 'You are logged in.',
      user: current_user
    }, status: :ok
    set_cors_headers
  end

  def respond_to_on_destroy
    log_out_success && return if current_user

    log_out_failure
  end

  def log_out_success
    render json: { message: 'You are logged out.' }, status: :ok
  end

  def log_out_failure
    render json: { message: 'Hmm nothing happened.' }, status: :unauthorized
  end

  protected

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      # Customize the full URL where the user is redirected after sign-in
      return 'http://localhost:8080/employees'
    end
    super
  end

  def set_cors_headers
    # Allow requests from your frontend application
    response.headers['Access-Control-Allow-Origin'] = 'http://localhost:8080'
    response.headers['Access-Control-Allow-Credentials'] = 'true'
    response.headers['Access-Control-Expose-Headers'] = 'Authorization, Uid'
  end

end