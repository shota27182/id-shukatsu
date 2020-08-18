class CompaniesController < ApplicationController
  
  def index
    @user = current_user
    @industries = Industry.all
    @WorkAreas = WorkArea.all
    @occupations = Occupation.all
    @WorkStyles = WorkStyle.all
    @welfares = Welfare.all
    @features = CompanyFeature.all
    @points = CompanyPoint.all
    
    if params[:industry] && params[:area] && params[:occupation] && params[:work_style] && params[:welfare] && params[:feature] && params[:point]
      @IndustriesSearch = params[:industry].split(",").map(&:to_i)
      if @IndustriesSearch.empty?
        @get_companies = Company.all
      else
        @get_companies = Company.includes(:industries).where(industries: {id: params[:industry].split(",").map(&:to_i)})
      end
      @AreasSearch = params[:area].split(",").map(&:to_i)
      if @AreasSearch.empty?
        @get_companies = @get_companies
      else
        @get_companies = @get_companies.includes(:work_areas).where(work_areas: {id: params[:area].split(",").map(&:to_i)})
      end
      @OccupationsSearch = params[:occupation].split(",").map(&:to_i)
      if @OccupationsSearch.empty?
        @get_companies = @get_companies
      else
        @get_companies = @get_companies.includes(:occupations).where(occupations: {id: params[:occupation].split(",").map(&:to_i)})
      end
      @WorkStylesSearch = params[:work_style].split(",").map(&:to_i)
      if @WorkStylesSearch.empty?
        @get_companies = @get_companies
      else
        @get_companies = @get_companies.includes(:work_styles).where(work_styles: {id: params[:work_style].split(",").map(&:to_i)})
      end
      @WelfaresSearch = params[:welfare].split(",").map(&:to_i)
      if @WelfaresSearch.empty?
        @get_companies = @get_companies
      else
        @get_companies = @get_companies.includes(:welfares).where(welfares: {id: params[:welfare].split(",").map(&:to_i)})
      end
      @FeaturesSearch = params[:feature].split(",").map(&:to_i)
      if @FeaturesSearch.empty?
        @get_companies = @get_companies
      else
        @get_companies = @get_companies.includes(:company_features).where(company_features: {id: params[:feature].split(",").map(&:to_i)})
      end
      @PointsSearch = params[:point].split(",").map(&:to_i)
      if @PointsSearch.empty?
        @get_companies = @get_companies.page(params[:page]).per(12)
      else
        @get_companies = @get_companies.includes(:company_points).where(company_points: {id: params[:point].split(",").map(&:to_i)}).page(params[:page]).per(12) 
      end
    end
    
    if params[:name]
      split_keywords = params[:name].split(/[[:blank:]]+/)
      @get_companies = Company.all 
      split_keywords.each do |keyword|
        next if keyword == "" 
        @get_companies = @get_companies.where('name LIKE(?)', "%#{keyword}%")
      end 
      @get_companies = @get_companies.page(params[:page]).per(12)
    end
  end

  def show
    @company = Company.find(params[:id]) 
    render :layout => 'application3'
  end
  
  def like
    UserCompany.create(user_id: current_user.id, company_id: params[:id])
    @company = Company.find(params[:id])
  end
  
  def good
  end
  
  def bad
  end
  
  def dislike
    @user_company = UserCompany.find_by(user_id: current_user.id, company_id: params[:id])
    @user_company.destroy
    @company = Company.find(params[:id])
  end
  
  def unfavorite
    @user_company = UserCompany.find_by(user_id: current_user.id, company_id: params[:id])
    @user_company.destroy
    redirect_to '/mypage/edit_favorite'
  end
  
  def search
     @companies = Company.includes(:industry).where("id?","%#{params[:id]}%")
  end
  
  def industry_params
    params.require(:industry).permit(:id)
  end
end
