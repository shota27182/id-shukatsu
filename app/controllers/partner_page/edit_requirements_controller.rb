class PartnerPage::EditRequirementsController < ApplicationController
  layout 'application4.html.erb'
  def index
    @company = Company.find(current_company.id)
    @company.company_profiles.build
    @company.build_company_requirement
  end
  
  def create
    if @company = current_company.update!(company_params)
      redirect_to "/partner_page/profile"
    else
      render action"index"
    end
    
  end
  
  private
      
      def company_params
        params.require(:company).permit(company_profiles_attributes:[:id, :title, :content, :_destroy],company_requirement_attributes:[:occupation, :work, :qualification, :holiday, :welfare])
      end
end
