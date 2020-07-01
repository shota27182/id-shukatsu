class PartnerPage::EditUniqueController < ApplicationController
  layout 'application4.html.erb'
  def index
    @partner_user_unique_form = PartnerUserUniqueForm.new
  end
  
  def create
    @partner_user_unique_form = PartnerUserUniqueForm.new(partner_user_unique_form_params)
    if @partner_user_unique_form.save
      redirect_to '/partner_page/edit_unique'
    else
      render action:'index'
    end
  end
  
  private
      
      def partner_user_unique_form_params
        params.require(:partner_user_unique_form).permit(company_feature_ids: [], company_point_ids: [], welfare_ids: [],work_style_ids: [], company_scale_ids: [], industry_ids: [], occupation_ids: [], work_area_ids: []).merge(company_id:current_company.id)
      end
end
