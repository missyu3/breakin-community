class UsersController < ApplicationController
  before_action :find_user, :find_relationship, :find_follows, :find_followers, only: [:show, :follows, :followers]

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
    @user_places = UserPlace.all
  end

  def follows
    @users = @user.followers
  end

  def followers
    @users = @user.followings
  end

  private

  def params_user
    params.require(:user).permit(:image, :nickname, :email, :remark)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def find_relationship
    @relationship = Relationship.all
  end

  def find_follows
    @follow = @relationship.where(follower_id: params[:id]).count
  end

  def find_followers
    @follower = @relationship.where(following_id: params[:id]).count
  end
end
