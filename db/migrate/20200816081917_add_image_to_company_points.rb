class AddImageToCompanyPoints < ActiveRecord::Migration[5.2]
  def change
    add_column :company_points, :image, :string
  end
end
