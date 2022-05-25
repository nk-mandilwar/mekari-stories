class RegistrationsController < Devise::RegistrationsController

	def create
    user = User.new(sign_up_params)
    if user.save
      render json: { success: true, date: { user: user } }.to_json, status: :ok
    else
      render  json: { success: false, errors: user.errors.full_messages.join(", ") }.to_json, status: :ok
    end
  end

	private

	def sign_up_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end

end