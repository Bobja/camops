class Admin::WorksController < ApplicationController
  before_action :authenticate_user
  before_action :admin_user
 
  def index
    @works = Work.all.order(status: :asc)
  end
  
  def new
    @work = Work.new
  end
  
  def create
    # render plain: params.inspect
    
    @work = Work.new(work_params)
    if @work.save
      redirect_to admin_works_path, success: '登録が完了しました'
    else
      flash.now[:danger] = '登録に失敗しました'
      render :new
    end
  end
  
  def show
    @work = Work.find(params[:id])
    @user = @work.user
  end
  
  def edit
    @work = Work.find(params[:id])
  end
  
  def update
    @work = Work.find(params[:id])
    @work.update_attributes(work_update_params)
    if @work.save
      redirect_to admin_work_path, success: '案件情報を更新しました'
    else
      flash.now[:danger] = '更新に失敗しました'
      render :edit
    end
  end
  
  def requesting
    @work = Work.find(params[:id])
    @work.user_id = params[:user_id]
    @work.status = "submitted"
    if @work.save
      redirect_to admin_work_path, success: '案件の依頼をしました'
    else
      flash.now[:danger] = '依頼に失敗しました'
      render :edit
    end
  end
  
  def destroy
    @work = Work.find(params[:id])
    @work.destroy
    redirect_to admin_works_path, success: '案件情報を削除しました'
  end
  
  private
    def work_params
      params.require(:work).permit(:date, :name, :company, :address, :unitPrice, :details)
    end
    
    def work_update_params
      params.require(:work).permit(:date, :name, :company, :address, :unitPrice, :totalPrice, :details)
    end
  
end
