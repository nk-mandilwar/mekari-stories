class SessionsController < Devise::SessionsController
  skip_before_action :authorize_request, except: :destroy

  def create
    if current_user.present?
      sign_out current_user
    end
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    token, expiry_time = JsonWebToken.encode(user_id: resource.id)
    render json: { message: "login Successfully", data: { token: token, expiry_time: expiry_time} }.to_json
  end

  private

    def respond_to_on_destroy
      render json: {:message => "logout Successfully"}
    end

end
