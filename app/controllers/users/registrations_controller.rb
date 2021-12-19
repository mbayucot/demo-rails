# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def sign_up_params
    params
      .require(:user)
      .permit(
        :email,
        :password,
        :password_confirmation,
        :first_name,
        :last_name
      )
  end
end
