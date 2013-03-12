class UsersController < ApplicationController
  def index
    authorize! :manage, current_user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    authorize! :manage, current_user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to users_path, :notice => "設定を適用させました。"
    else
      redirect_to params[:redirect_path], :alert => "入力項目にエラーがあり、保存できませんでした。"
    end
  end

  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end
end
