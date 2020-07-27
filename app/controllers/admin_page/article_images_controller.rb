class AdminPage::ArticleImagesController < ApplicationController
  def create
    @article_image = ArticleImage.new(params.require(:article_image).permit(:image))
    @article_image.article_id = params[:article_id]
    if @article_image.save
      render json: {url: @article_image.url("280x210")}, status: 200
    else
      render nothing: true, status: 500
    end
  end
end
