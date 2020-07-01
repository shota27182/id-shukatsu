class UserInternshipsController < ApplicationController
  before_action :logged_in_user
  
  def index
  end
  
  def new
    @user_internship = UserInternship.new
  end
  
  def create
    @user_internship = UserInternship.new(user_internship_params)
    @user_internship.save
  end
  
  def edit
    @user_internship = UserInternship.find_by(id: params[:id])
  end
  
  def update
    @user_internship = UserInternship.update(user_internship_params)
    @user_internship = current_user.user_internship
  end
  
  private
      
      def user_internship_params
        params.require(:user_internship).permit(:internship).merge(user_id: current_user.id)
      end
end
