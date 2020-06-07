class Admin::UsersController < ApplicationController
  before_action :authenticate_user
  before_action :admin_user
 
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, success: '登録が完了しました'
    else
      flash.now[:danger] = '登録に失敗しました'
      render :new
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, success: 'ユーザーを削除しました'
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :address, :birthday, :rank)
    end
end
