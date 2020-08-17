class AdminPage::EditGeneralController < ApplicationController
  def index
    @company = Company.find_by(id: params[:company_id])
     @partner_user_general_form = PartnerUserGeneralForm.new(name: @company.name, introduction: @company.introduction, category: @company.category, people: @company.people,kana: @company.kana,
                                                            img: @company.img, icon: @company.icon, url: @company.url, establishment: @company.establishment, address: @company.address)
  end
  
  def create
    @company = Company.find_by(id: params[:company_id])
    @company.update(partner_user_general_form_params)
    redirect_to admin_page_company_edit_general_path
  end
  
  private
  
    def partner_user_general_form_params
      params.require(:partner_user_general_form).permit(:name, :introduction, :category, :people, :img, :icon, :url, :establishment, :address)
    end
end
