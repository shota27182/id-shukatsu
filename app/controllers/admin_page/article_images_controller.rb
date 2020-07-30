class AdminPage::ArticleImagesController < ApplicationController
  
  IMAGE_EXT = [".gif", ".jpeg", ".jpg", ".png", ".svg"]
  def create
    @article_image = ArticleImage.new(params.require(:article_image).permit(:image))
    @article_image.save
    respond_to do |format|
      format.json { render :json => { url: @article_image.image.url, article_image_id: @article_image.id } }
    end
  end
end
