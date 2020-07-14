class Mypage::WishController < ApplicationController
    before_action :logged_in_user
    
    
    def index
        @mypage_wish_form = MypageWishForm.new(company_scale_ids: current_user.company_scales.pluck(:id),industry_ids: current_user.industries.pluck(:id),occupation_ids: current_user.occupations.pluck(:id),work_area_ids: current_user.work_areas.pluck(:id))
    end
    
    def create
        @mypage_wish_form = MypageWishForm.new(mypage_wish_form_params)
        @mypage_wish_form.save
        redirect_to '/mypage/wish'
    rescue
        render action:'index'
    end
    
    private
      def mypage_wish_form_params
        params.require(:mypage_wish_form).permit(company_scale_ids: [], industry_ids: [], occupation_ids: [], work_area_ids: []).merge(user_id:current_user.id)
      end
end
