class AdminPage::EditUniqueController < ApplicationController
  def index
    @company = Company.find_by(id: params[:company_id])
    if @company.company_features.present?
      company_feature_ids= @company.company_features.pluck(:id)
    else
      company_feature_ids = []
    end
    if @company.company_points.present?
       company_point_ids= @sompany.company_points.pluck(:id) 
    else
      company_point_ids = []
    end
    if @company.welfares.present?
      welfare_ids = @company.welfares.pluck(:id)
    else
      welfare_ids =[]
    end
    if @company.work_styles.present?
      work_style_ids = @company.work_styles.pluck(:id)
    else
       work_style_ids = []
    end
    if @company.company_scales.present?
      company_scale_ids = @company.company_scales.pluck(:id)
    else
      company_scale_ids =[]
    end
    if @company.industries.present?
      industry_ids = @company.industries.pluck(:id)
    else
      industry_ids = []
    end
    if @company.occupations.present?
       occupation_ids = @company.occupations.pluck(:id)
    else
      occupation_ids = []
    end
    if @company.work_areas.present?
      work_area_ids = @company.work_areas.pluck(:id)
    else
      work_area_ids = []
    end
    @partner_user_unique_form = PartnerUserUniqueForm.new(company_feature_ids: company_feature_ids, company_point_ids: company_point_ids, welfare_ids: welfare_ids, work_style_ids: work_style_ids, company_scale_ids: company_scale_ids,industry_ids: industry_ids,occupation_ids: occupation_ids, work_area_ids: work_area_ids)
  end
  
  def create
    @partner_user_unique_form = PartnerUserUniqueForm.new(partner_user_unique_form_params)
    if @partner_user_unique_form.save
      redirect_to admin_page_company_edit_unique_path
    else
      render action:'index'
    end
  end
  
  private
      
      def partner_user_unique_form_params
        params.require(:partner_user_unique_form).permit(company_feature_ids: [], company_point_ids: [], welfare_ids: [],work_style_ids: [], company_scale_ids: [], industry_ids: [], occupation_ids: [], work_area_ids: []).merge(company_id: params[:company_id])
      end
end
