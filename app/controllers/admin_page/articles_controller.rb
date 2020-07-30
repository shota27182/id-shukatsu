class AdminPage::ArticlesController < ApplicationController
  def index
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.create(article_params)
    redirect_to '/admin_page/articles'
  end
  
  def edit
  end
  
  def update
  end
  
  private
      def article_params
        params.require(:article).permit(:title, :content)
      end
      
end