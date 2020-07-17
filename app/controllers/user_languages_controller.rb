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
    @user_language.save
    @user_languages = current_user.user_languages
  end
  
  def edit
    @user_language = UserLanguage.find_by(id: params[:id])
  end
  
  def update
    @user_language = UserLanguage.find_by(id: params[:id])
    @user_language.update(user_language_params)
    @user_languages = current_user.user_languages
  end
  
  def destroy
    @user_language = UserLanguage.find_by(id: params[:id])
    @user_language.destroy
    @user_languages = current_user.user_languages
  end
  
  private
      
      def user_language_params
        params.require(:user_language).permit(:language, :level).merge(user_id: current_user.id)
      end
end
