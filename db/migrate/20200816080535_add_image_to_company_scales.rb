class AddImageToCompanyScales < ActiveRecord::Migration[5.2]
  def change
    add_column :company_scales, :image, :string
  end
end
