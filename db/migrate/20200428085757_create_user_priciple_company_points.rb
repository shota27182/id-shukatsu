class CreateUserPricipleCompanyPoints < ActiveRecord::Migration[5.1]
  def change
    create_table :user_priciple_company_points do |t|
      t.references :user_priciple, foreign_key: true
      t.references :company_point, foreign_key: true

      t.timestamps
    end
  end
end
