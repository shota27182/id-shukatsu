class AdminPage::ArticlesController < ApplicationController
  def index
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.create(post_params)
    redirect_to '/admin_page/articles'
  end
  
  def edit
  end
  
  def update
  end
  
  private
      def post_params
        params.require(:post).permit(:img, :title, :content)
      end
      
end