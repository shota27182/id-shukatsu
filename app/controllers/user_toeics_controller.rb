class UserToeicsController < ApplicationController
  before_action :logged_in_user
  
  def index
  end
  
  def new
    @user_toeic = UserToeic.new
  end
  
  def create
    @user_toeic = UserToeic.new(user_toeic_params)
    respond_to do |format|
      if @user_toeic.save
        format.html { redirect_to @user_toeic, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user_toeic }
        format.js { @status = "success"}
      else
        format.html { render :new }
        format.json { render json: @user_toeic.errors, status: :unprocessable_entity }
        format.js { @status = "fail" }
      end
    end
  end
  
  def edit
    @user_toeic = UserToeic.find_by(id: params[:id])
  end
  
  def update
    @user_toeic = UserToeic.find_by(id: params[:id])
    respond_to do |format|
      if @user_toeic.update(user_toeic_params)
        format.html { redirect_to @user_toeic, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user_toeic }
        format.js { @status = "success"}
      else
        format.html { render :new }
        format.json { render json: @user_toeic.errors, status: :unprocessable_entity }
        format.js { @status = "fail" }
      end
    end
    
  end
  
  private
      
      def user_toeic_params
        params.require(:user_toeic).permit(:toeic).merge(user_id: current_user.id)
      end
end
