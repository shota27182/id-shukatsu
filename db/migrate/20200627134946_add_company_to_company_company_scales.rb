class AddCompanyToCompanyCompanyScales < ActiveRecord::Migration[5.2]
  def change
    add_reference :company_company_scales, :company, foreign_key: true
  end
end
