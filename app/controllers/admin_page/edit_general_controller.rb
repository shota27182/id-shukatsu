class AdminPage::EditGeneralController < ApplicationController
  def index
    @company = Company.find_by(id: params[:company_id])
     @partner_user_general_form = PartnerUserGeneralForm.new(name: @company.name, introduction: @company.introduction, category: @company.category, people: @company.people,kana: @company.kana,
                                                            img: @company.img, icon: @company.icon, url: @company.url, establishment: @company.establishment, address: @company.address)
  end
  
  def create
     @partner_user_general_form = PartnerUserGeneralForm.new(partner_user_general_form_params)
     if @partner_user_general_form.save
      redirect_to admin_page_company_edit_general_path
     else
      render action: "index"
     end
  end
  
  private
  
    def partner_user_general_form_params
      params.require(:partner_user_general_form).permit(:name,:kana , :introduction, :category, :people, :img, :icon, :url, :address).merge(company_id: params[:company_id])
    end
end
