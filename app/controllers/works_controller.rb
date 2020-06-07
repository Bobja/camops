class WorksController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:show, :edit, :update]}
  
  def index
  end
  
end
