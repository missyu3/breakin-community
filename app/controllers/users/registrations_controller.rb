class Users::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only: [:update, :destroy]

  def check_guest
    if resource.email == 'guestlogin@example.com'
      redirect_to root_path, alert: 'ゲストユーザーは編集・削除できません。'
    end
  end

end