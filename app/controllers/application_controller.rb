class ApplicationController < ActionController::API
  prepend_before_action :authenticate_user!
  before_action :authorize_request

  protected

    def authorize_request
      header = request.headers['Authorization']
      header = header.split(' ').last if header
      begin
        decoded = JsonWebToken.decode(header)
        Wms::User.find(decoded[:user_id])
      rescue ActiveRecord::RecordNotFound => e
        render json: { errors: e.message }, status: :unauthorized
      rescue JWT::DecodeError => e
        render json: { errors: e.message }, status: :unauthorized
      end
    end

end