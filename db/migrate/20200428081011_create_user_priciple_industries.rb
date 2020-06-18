class CreateUserPricipleIndustries < ActiveRecord::Migration[5.1]
  def change
    create_table :user_priciple_industries do |t|
      t.references :user_priciple, foreign_key: true
      t.references :industry, foreign_key: true

      t.timestamps
    end
  end
end
