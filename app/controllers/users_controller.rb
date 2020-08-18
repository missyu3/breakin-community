class UsersController < ApplicationController
  
  def edit
  end
  
  def update
    if current_user.update(params_user)
      redirect_to root_path
    else
      render :edit
    end
  end
  private

  def params_user
    params.require(:user).permit(:nickname, :email)
  end
end
