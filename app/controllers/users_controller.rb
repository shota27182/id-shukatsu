class UsersController < ApplicationController
  layout 'application2.html.erb'
  before_action :logged_in_user, only: [:edit, :update]
  def new
    @user = Signup.new
  end
  
  def create
    @user = Signup.new(signup_params)
    if @user.save
      redirect_to "/users/wait"
    else
      render 'new'
    end
  end
  
  def wait
    
  end
  
  def welcome
    @user = User.find(current_user.id)
  end
  
  def complete
  end
  
  
  
  
  
  private
     
    def signup_params
      params.require(:signup).permit(:kana, :name, :email, :password, :password_confirmation, :invitation_token)
    end
    
end
