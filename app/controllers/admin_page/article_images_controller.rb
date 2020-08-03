class AdminPage::ArticleImagesController < ApplicationController
  
  def create
    @article_image = ArticleImage.new
    @article_image.image = params[:file]
    @article_image.save
    respond_to do |format|
      format.json { render :json => { url: @article_image.image.url, article_image_id: @article_image.id } }
    end
  end
end
