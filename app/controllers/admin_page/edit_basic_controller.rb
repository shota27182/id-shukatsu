class AdminPage::EditBasicController < ApplicationController
  def index
    @company = Company.find_by(id: params[:company_id])
    if !@company.company_general.present?
      @company_general = @company.build_company_general
      @commpany_detail_generals = @company_general.company_detail_generals.build
    else
      @company_general = @company.company_general
      @commpany_detail_generals = @company_general.company_detail_generals
    end
    
  end
  
  def create
    
  end
  
  private
      
      def company_params
        params.require(:company_general).permit(company_general_attributes:[:id, :man, :woman, :humanity_man, :humanity_woman, :science_man, :science_woman, :work_duration, :overtime, :holiday_use, :_destroy, company_detail_generals_attributes:[]],company_requirement_attributes:[:id,:occupation, :work, :qualification, :holiday, :welfare])
      end
end
