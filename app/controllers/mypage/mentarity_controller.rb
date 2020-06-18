class Mypage::MentarityController < ApplicationController
    
    def index
        @mypage_mentarity_form = MypageMentarityForm.new(company_feature_ids: current_user.company_features.pluck(:id),company_point_ids: current_user.company_points.pluck(:id),welfare_ids: current_user.welfares.pluck(:id),work_style_ids: current_user.work_styles.pluck(:id))
    end
    
    def create
        @mypage_mentarity_form = MypageMentarityForm.new(mypage_mentarity_form_params)
        @mypage_mentarity_form.save
        redirect_to '/mypage/mentarity'
    rescue
        render action:'index'
    end
    
    private
      
      def mypage_mentarity_form_params
          params.require(:mypage_mentarity_form).permit(company_feature_ids: [], company_point_ids: [], welfare_ids: [],work_style_ids: []).merge(user_id: current_user.id)
      end
end
