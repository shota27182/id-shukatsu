class ArticlesController < ApplicationController
  def index
    @industries = Industry.all
    @WorkAreas = WorkArea.all
    @occupations = Occupation.all
    
    if params[:industry]
      @IndustriesSearch = params[:industry].split(",").map(&:to_i)
    end
    if params[:area]
      @AreasSearch = params[:area].split(",").map(&:to_i)
    end
    if params[:occupation]
      @OccupationsSearch = params[:occupation].split(",").map(&:to_i)
    end
  end

  def show
  end
end
