class Mypage::AccountController < ApplicationController
  before_action :logged_in_user
  def index
    user = User.find(current_user.id)
    @mypage_account_form = MypageAccountForm.new(email: user.email)
  end
  
  def create
    @mypage_account_form = MypageAccountForm.new(mypage_account_form_params)
    @mypage_account_form.save
    redirect_to "/mypage/profile"
  end
  
  private
    
    def mypage_account_form_params
      params.require(:mypage_account_form).permit(:name, :email, :password, :password_confirmation).merge(user_id: current_user.id)
    end
end
