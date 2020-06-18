class CreateUserPricipleWelfares < ActiveRecord::Migration[5.1]
  def change
    create_table :user_priciple_welfares do |t|
      t.references :user_priciple, foreign_key: true
      t.references :welfare, foreign_key: true

      t.timestamps
    end
  end
end
