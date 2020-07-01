class PartnerPage::EditGeneralController < ApplicationController
  layout 'application4.html.erb'
  
  def index
    @partner_user_general_form = PartnerUserGeneralForm.new
  end
  
  def create
    params[:partner_user_general_form][:establishment] = Date.new params[:partner_user_general_form]["establishment(1i)"].to_i,params[:partner_user_general_form]["establishment(2i)"].to_i,params[:partner_user_general_form]["establishment(3i)"].to_i
    @partner_user_general_form = PartnerUserGeneralForm.new(partner_user_general_form_params)
    if @partner_user_general_form.save
      redirect_to "/partner_page/edit_general"
    else
      render action: "index"
    end
  end
  
  private
    
    def partner_user_general_form_params
      params.require(:partner_user_general_form).permit(:name, :introduction, :category, :people, :img, :icon, :url, :establishment, :address).merge(company_id: current_company.id)
    end
end
