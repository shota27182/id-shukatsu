class AdminPage::ArticlesController < ApplicationController
  layout 'application4.html.erb'
  
  def index
    @articles = Article.all.page(params[:page]).per(12)
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.create(article_params)
    redirect_to '/admin_page/articles'
  end
  
  def edit
    @article = Article.find_by(id: params[:id])
  end
  
  def update
    @article = Article.find_by(id: params[:id])
    @article.update(article_params)
    redirect_to  edit_admin_page_article_path
  end
  
  private
      def article_params
        params.require(:article).permit(:img, :title, :content,tag_ids: [])
      end
      
end