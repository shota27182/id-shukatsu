class AddRememberDigestToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :remember_digest, :string
  end
end
