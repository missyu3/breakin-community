class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ゲストユーザーを編集・削除できないようにする
  def check_guest
    email = resource.email
    redirect_to root_path, alert: 'ゲストユーザーの変更・削除はできません。' if email == 'guestlogin@example.com'
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
