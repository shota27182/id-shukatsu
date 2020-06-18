class CreateUserPricipleCompanyFeatures < ActiveRecord::Migration[5.1]
  def change
    create_table :user_priciple_company_features do |t|
      t.references :user_priciple, foreign_key: true
      t.references :company_feature, foreign_key: true

      t.timestamps
    end
  end
end
