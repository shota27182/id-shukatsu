class UsersController < ApplicationController
  layout 'application2.html.erb'
  before_action :logged_in_user, only: [:edit, :update]
  before_action :active_user, only:[:new, :create]
  def new
    session[:token] = params[:token]
    @user = Signup.new
  end
  
  def create
    @user = Signup.new(signup_params)
    if @user.save
      if session[:token]
        passive_user = User.find_by(email: params[:signup][:email])
        invitation = passive_user.passive_invitations.build(invite_id: User.find_by(invitation_token: session[:token]).id)
        invitation.save
      end
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
