class Users::CoresController < ApplicationController
  before_action :basic_registered_user
  before_action :already_core_registered 
  layout 'application2.html.erb'
  
  def index
    @user = User.find(current_user.id)
    @users_cores_form = UsersCoresForm.new
  end
  
  def create
    @user = User.find(current_user.id)
    @users_cores_form = UsersCoresForm.new(users_cores_form_params)
    @users_cores_form.save
    @notification = current_user.notifications.build(
      title: 'ID就活へようこそ',
      content: 'ID就活では、あなたの内定までの道のりをサポートします。すぐに使いこなせるよう、効率よく情報収集するコツをご紹介します！' 
      )
    @notification.save
    current_user.generate_invitation_token
    @notification2 = current_user.notifications.build(
      title: '友人・知人を紹介して報酬をGETしよう！',
      content: '友達がフレンド登録のときにコードを入力すると、あなたと友達に必ず500円分のAMAZONギフト券をプレゼントしています。(詳細は<a href="/mypage/friend_referrals/new">こちら</a>)' 
      )
    @notification2.save
    redirect_to '/users/complete'
  rescue
    @user = User.find(current_user.id)
    render action:"index"
  end
  
  private
      def users_cores_form_params
        params.require(:users_cores_form).permit(company_feature_ids: [], company_point_ids: [], welfare_ids: [],work_style_ids: [], company_scale_ids: [], industry_ids: [], occupation_ids: [], work_area_ids: []).merge(user_id:current_user.id)
      end
      
      def already_core_registered
        if logged_in? && current_user.status == 'core_registered'
          redirect_to '/mypage'
        end
      end
      
end