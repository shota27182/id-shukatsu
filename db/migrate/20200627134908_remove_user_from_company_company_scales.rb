class RemoveUserFromCompanyCompanyScales < ActiveRecord::Migration[5.2]
  def change
    remove_reference :company_company_scales, :user, foreign_key: true
  end
end
