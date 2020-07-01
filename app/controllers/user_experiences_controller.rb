class UserExperiencesController < ApplicationController
  before_action :logged_in_user
  
  def index
  end
  
  def new
    @user_experience = UserExperience.new
  end
  
  def create
    @user_experience = UserExperience.new(user_experience_params)
    @user_experience.save
  end
  
  def edit
    @user_experience = UserExperience.find_by(id: params[:id])
  end
  
  def update
    @user_experience = UserExperience.update(user_experience_params)
    @user_experiences = current_user.user_experience
  end
  
  private
      
      def user_experience_params
        params.require(:user_experience).permit(:experience).merge(user_id: current_user.id)
      end
end
