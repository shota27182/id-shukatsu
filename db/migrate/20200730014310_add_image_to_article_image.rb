class AddImageToArticleImage < ActiveRecord::Migration[5.2]
  def change
    add_column :article_images, :image, :string
  end
end
