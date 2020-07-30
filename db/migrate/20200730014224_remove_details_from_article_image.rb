class RemoveDetailsFromArticleImage < ActiveRecord::Migration[5.2]
  def change
    remove_column :article_images, :image_file_name, :string
    remove_column :article_images, :image_content_type, :string
    remove_column :article_images, :image_file_size, :integer
    remove_column :article_images, :image_updated_at, :datetime
  end
end
