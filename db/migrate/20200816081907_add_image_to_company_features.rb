class AddImageToCompanyFeatures < ActiveRecord::Migration[5.2]
  def change
    add_column :company_features, :image, :string
  end
end
