class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger
  
  helper_method :current_user, :logged_in?, :authenticate_user
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
  
  def authenticate_user
    if current_user == nil
      redirect_to root_path, danger: 'ログインが必要です'
    end
  end
  
  def forbid_login_user
    if current_user
      redirect_to users_path, danger: 'すでにログインしています'
    end
  end
  
  def ensure_correct_user
    if current_user.admin != true && current_user.id != params[:id].to_i
      redirect_to users_path, danger: '権限がありません'
    end
  end
end
