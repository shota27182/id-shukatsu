class UserLanguagesController < ApplicationController
  before_action :logged_in_user
  
  def index
    @user_languages = UserLanguage.all
  end
  
  def new
    @user_language = UserLanguage.new
  end
  
  def create
    @user_language = UserLanguage.new(user_language_params)
    respond_to do |format|
      if @user_language.save
        format.html { redirect_to @user_language, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user_language }
        format.js { @status = "success"}
      else
        format.html { render :new }
        format.json { render json: @user_language.errors, status: :unprocessable_entity }
        format.js { @status = "fail" }
      end
    end
       
  end
  
  def edit
    @user_language = UserLanguage.find_by(id: params[:id])
  end
  
  def update
    @user_language = UserLanguage.find_by(id: params[:id])
    respond_to do |format|
      if @user_language.update(user_language_params)
        format.html { redirect_to @user_lamguage, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user_language }
        format.js { @status = "success"}
      else
        format.html { render :new }
        format.json { render json: @user_language.errors, status: :unprocessable_entity }
        format.js { @status = "fail" }
      end
    end
  end
  
  private
      
      def user_language_params
        params.require(:user_language).permit(:language, :level).merge(user_id: current_user.id)
      end
end
