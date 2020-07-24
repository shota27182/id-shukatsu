class AdminPage::ArticlesController < ApplicationController
  def new
    @article = Article.new
  end
  
  def create
    @article.save
  end
  
  private
      def post_params
        params.require(:post).permit(:img, :title, :content)
      end
      
end
