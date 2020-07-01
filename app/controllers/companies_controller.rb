class CompaniesController < ApplicationController
  
  def index
    if logged_in
      @user = current_user
    end
    @industries = Industry.all
    @WorkAreas = WorkArea.all
    @occupations = Occupation.all
    @WorkStyles = WorkStyle.all
    @welfares = Welfare.all
    @features = CompanyFeature.all
    @points = CompanyPoint.all
    
    if params[:industry]
      @IndustriesSearch = params[:industry].split(",").map(&:to_i)
      if @IndustriesSearch.empty?
        @get_companies = Company.all
      else
        @get_companies = Company.includes(:industries).where(industries: {id: params[:industry].split(",").map(&:to_i)})
      end
    end
    if params[:area]
      @AreasSearch = params[:area].split(",").map(&:to_i)
      if @AreasSearch.empty?
        @get_companies = @get_companies
      else
        @get_companies = @get_companies.includes(:work_areas).where(work_areas: {id: params[:area].split(",").map(&:to_i)})
      end
    end
    if params[:occupation]
      @OccupationsSearch = params[:occupation].split(",").map(&:to_i)
      if @OccupationsSearch.empty?
        @get_companies = @get_companies
      else
        @get_companies = @get_companies.includes(:occupations).where(occupations: {id: params[:occupation].split(",").map(&:to_i)})
      end
    end
    if params[:work_style]
      @WorkStylesSearch = params[:work_style].split(",").map(&:to_i)
      if @WorkStylesSearch.empty?
        @get_companies = @get_companies
      else
        @get_companies = @get_companies.includes(:work_styles).where(work_styles: {id: params[:work_style].split(",").map(&:to_i)})
      end
    end
    if params[:welfare]
      @WelfaresSearch = params[:welfare].split(",").map(&:to_i)
      if @WelfaresSearch.empty?
        @get_companies = @get_companies
      else
        @get_companies = @get_companies.includes(:welfares).where(welfares: {id: params[:welfare].split(",").map(&:to_i)})
      end
    end
    if params[:feature]
      @FeaturesSearch = params[:feature].split(",").map(&:to_i)
      if @FeaturesSearch.empty?
        @get_companies = @get_companies
      else
        @get_companies = @get_companies.includes(:company_features).where(company_features: {id: params[:feature].split(",").map(&:to_i)})
      end
    end
    if params[:point]
      @PointsSearch = params[:point].split(",").map(&:to_i)
      if @PointsSearch.empty?
        @get_companies = @get_companies
      else
        @get_companies = @get_companies.includes(:company_points).where(company_points: {id: params[:point].split(",").map(&:to_i)})
      end
    end
  end

  def show
    @company = Company.find(params[:id]) 
  end
  
  def like
    UserCompany.create(user_id: current_user.id, company_id: params[:id])
    @company = Company.find(params[:id])
    redirect_to "/companies/#{@company.id}"
  end
  
  def search
     @companies = Company.includes(:industry).where("id?","%#{params[:id]}%")
  end
  
  def industry_params
    params.require(:industry).permit(:id)
  end
  
end
