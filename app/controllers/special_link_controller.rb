class SpecialLinkController < ApplicationController
  def index
    @industries = Industry.all
    @WorkAreas = WorkArea.all
    @occupations = Occupation.all
    @WorkStyles = WorkStyle.all
    @welfares = Welfare.all
    @features = CompanyFeature.all
    @points = CompanyPoint.all
    
    if params[:industry]
        @company = Company.includes(:industries).where(industries:{id: params[:industry]})
        @event = Event.includes(:company => :industries).where(industries: {id: params[:industry]})
        @special_title = Industry.find_by(id: params[:industry]).name+ '業界の企業'
    end
    if params[:area]
        @company = Company.includes(:work_areas).where(work_areas:{id: params[:area]})
        @event = Event.includes(:company => :work_areas).where(work_areas: {id: params[:area]})
        @special_title = WorkArea.find_by(id: params[:area]).name+ 'の企業'
    end
    if params[:work_style]
        @company = Company.includes(:work_styles).where(work_styles:{id: params[:work_style]})
        @event = Event.includes(:company => :work_styles).where(work_styles: {id: params[:work_style]})
        @special_title = WorkStyle.find_by(id: params[:work_style]).name+ 'の企業'
    end
    if params[:welfare]
        @company = Company.includes(:welfares).where(welfares:{id: params[:welfare]})
        @event = Event.includes(:company => :welfares).where(welfares: {id: params[:welfare]})
        @special_title = Welfare.find_by(id: params[:welfare]).name+ 'の企業'
    end
    if params[:feature]
       @company = Company.includes(:company_features).where(company_features:{id: params[:feature]})
        @event = Event.includes(:company => :company_features).where(company_features: {id: params[:feature]})
        @special_title = CompanyFeature.find_by(id: params[:feature]).name+ 'の企業'
    end
    if params[:point]
      @company = Company.includes(:company_points).where(company_points:{id: params[:point]})
        @event = Event.includes(:company => :company_points).where(company_points: {id: params[:point]})
        @special_title = CompanyPoint.find_by(id: params[:point]).name+ 'の企業'
    end
  end
end
