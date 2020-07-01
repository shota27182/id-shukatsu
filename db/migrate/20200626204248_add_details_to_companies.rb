class AddDetailsToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :email, :string
    add_column :companies, :password_digest, :string
  end
end
