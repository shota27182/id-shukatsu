class ArticlesController < ApplicationController
  def index
    @industries = Industry.all
    @WorkAreas = WorkArea.all
    @occupations = Occupation.all
    
    if params[:category] == '就活初心者向けコンテンツ' && !params[:sub_category]
      @article = Article.includes(:tags).where(tags:{id: 1..3})
    end
    if params[:category] == '業界別コンテンツ' && !params[:sub_category]
      @article = Article.includes(:tags).where(tags:{id: 4..18})
    end
    if params[:category] == '選考対策コンテンツ' && !params[:sub_category]
      @article = Article.includes(:tags).where(tags:{id: 19..25})
    end
    if params[:category] == '所属別コンテンツ' && !params[:sub_category]
      @article = Article.includes(:tags).where(tags:{id: 25..30})
    end
    if params[:category] == 'キャリアコンテンツ' && !params[:sub_category]
      @article = Article.includes(:tags).where(tags:{id: 30..33})
    end
    if params[:category] == '内定者向けコンテンツ' && !params[:sub_category]
      @article = Article.includes(:tags).where(tags:{id: 33..35})
    end
    if params[:category] == 'その他のコンテンツ' && !params[:sub_category]
      @article = Article.includes(:tags).where(tags:{id: 35..37})
    end
    if params[:sub_category]
      @article = Article.includes(:tags).where(tags:{name: params[:sub_category]})
    end
  end

  def show
    @article = Article.find_by(id: params[:id])
  end
end
