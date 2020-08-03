class AdminPage::CompaniesController < ApplicationController
  def new
    @company = Company.new
    @company.build_company_requirement
    @company.company_profiles.build
  end
  
  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to "/admin_page/companies"
    else
      render action"new"
    end
  end

  def edit
  end

  def index
  end
  
  def import
    Company.import(params[:file])
    redirect_to '/admin_page/companies'
  end
  
  private
      
      def company_params
        params.require(:company).permit(:email,:password,:password_confirmation,:introduction,:name,:kana, :category, :people, :img, :icon, :url, :address, :establishment,
        company_feature_ids: [], company_point_ids: [], welfare_ids: [],work_style_ids: [], company_scale_ids: [], industry_ids: [], occupation_ids: [], work_area_ids: [],
        company_profiles_attributes:[:id, :title, :content, :_destroy],company_requirement_attributes:[:occupation, :work, :qualification, :holiday, :welfare])
      end
end
