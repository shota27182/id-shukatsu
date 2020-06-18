class CreateUserBasics < ActiveRecord::Migration[5.1]
  def change
    create_table :user_basics do |t|
      t.references "user", foreign_key: true
      t.string "name"
      t.string "kana"
      t.string "sex"
      t.date "birthday"
      t.string "tel"
      t.string "address1"
      t.string "address2"
      t.string "phone_number"
      t.string "building_name"
      t.timestamps
    end
  end
end
