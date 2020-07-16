class UserToeflsController < ApplicationController
  before_action :logged_in_user
  
  def index
  end
  
  def new
    @user_toefl = UserToefl.new
    respond_to do |format| 
      format.html{ redirect_to @user_toefl, notice: 'User was successfully created.' }
      format.js {} 
    end
  end
  
  def create
    @user_toefl = UserToefl.new(user_toefl_params)
    respond_to do |format|
      if @user_toefl.save
        format.html { redirect_to @user_toefl, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user_toefl }
        format.js { @status = "success"}
      else
        format.html { render :new }
        format.json { render json: @user_toefl.errors, status: :unprocessable_entity }
        format.js { @status = "fail" }
      end
    end
  end
  
  def edit
    @user_toefl = UserToefl.find_by(id: params[:id])
  end
  
  def update
    @user_toefl = UserToefl.find_by(id: params[:id])
    respond_to do |format|
      if @user_toefl.update(user_toefl_params)
        format.html { redirect_to @user_toefl, notice: 'User was successfully created.' }
        format.json { render :show, location: @user_toefl }
        format.js { @status = "success"}
      else
        format.html { render :new }
        format.json { render json: @user_toefl.errors, status: :unprocessable_entity }
        format.js { @status = "fail" }
      end
    end
  end
  
  private
      
      def user_toefl_params
        params.require(:user_toefl).permit(:toefl,:type).merge(user_id: current_user.id)
      end
end
