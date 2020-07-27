class RemoveImageFromArticleImage < ActiveRecord::Migration[5.2]
  def change
    remove_column :article_images, :image, :string
  end
end
