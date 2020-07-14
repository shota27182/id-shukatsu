class Mypage::MailTypeController < ApplicationController
  def index
    @user_receive = current_user.user_receive
    @mypage_mail_form = MypageMailForm.new(magazine: @user_receive.magazine, scout: @user_receive.scout)
  end
  
  def create
    @mypage_mail_form = MypageMailForm.new(mypage_mail_form_params)
    if @mypage_mail_form.save
      redirect_to '/mypage/mail_type'
    else
      render 'index'
    end
  end
  
  private
      
      def mypage_mail_form_params
          params.require(:mypage_mail_form).permit(:magazine, :scout).merge(user_id: current_user.id)
      end
end
