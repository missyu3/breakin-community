class UsersController < ApplicationController
  def edit
  end

  def update
    redirect_to root_path, alert: 'ゲストユーザーは編集・削除できません。' and return if current_user.email == 'guestlogin@example.com'

    if current_user.update(params_user)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @user_places = UserPlace.all
    @relationship = Relationship.all
    @follow = @relationship.where(follower_id: params[:id]).count
    @follower = @relationship.where(following_id: params[:id]).count
  end
  
  def follows
    @user = User.find(params[:id])
    @users = @user.followers
    @relationship = Relationship.all
    @follow = @relationship.where(follower_id: params[:id]).count
    @follower = @relationship.where(following_id: params[:id]).count
  end
  
  def followers
    @user = User.find(params[:id])
    @users = @user.followings
    @relationship = Relationship.all
    @follow = @relationship.where(follower_id: params[:id]).count
    @follower = @relationship.where(following_id: params[:id]).count
  end

  private

  def params_user
    params.require(:user).permit(:image, :nickname, :email, :remark)
  end
end
