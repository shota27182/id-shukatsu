class AddImageToWelfares < ActiveRecord::Migration[5.2]
  def change
    add_column :welfares, :image, :string
  end
end
