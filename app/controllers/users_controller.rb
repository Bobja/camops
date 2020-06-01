class UsersController < ApplicationController
  before_action :authenticate_user
  
  def index
  end
   
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    # render plain: params.inspect
    
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    if @user.save
      redirect_to user_path, success: 'アカウント情報を更新しました'
    else
      flash.now[:danger] = '更新に失敗しました'
      render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :address, :birthday, :rank)
  end
  
end