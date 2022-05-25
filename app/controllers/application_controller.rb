class ApplicationController < ActionController::API
  before_action :authorize_request

  respond_to :json

  protected

    def authorize_request
      token = request.headers['Authorization']
      token = token.split(' ').last if token
      begin
        decoded = JsonWebToken.decode(token)
        @current_user = User.find(decoded[:user_id])
      rescue ActiveRecord::RecordNotFound => e
        render json: { errors: e.message }, status: :unauthorized
      rescue JWT::DecodeError => e
        render json: { errors: e.message }, status: :unauthorized
      end
    end

end