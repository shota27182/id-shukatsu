class RemoveArticleFromArticleImage < ActiveRecord::Migration[5.2]
  def change
    remove_reference :article_images, :article, foreign_key: true
  end
end
