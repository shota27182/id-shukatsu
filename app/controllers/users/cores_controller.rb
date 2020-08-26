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