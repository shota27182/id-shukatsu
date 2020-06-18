class CreateUserPricipleOccupations < ActiveRecord::Migration[5.1]
  def change
    create_table :user_priciple_occupations do |t|
      t.references :user_priciple, foreign_key: true
      t.references :occupation, foreign_key: true

      t.timestamps
    end
  end
end
