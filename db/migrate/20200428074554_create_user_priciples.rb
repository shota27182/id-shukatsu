class CreateUserPriciples < ActiveRecord::Migration[5.1]
  def change
    create_table :user_priciples do |t|
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
