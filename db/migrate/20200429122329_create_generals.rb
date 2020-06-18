class CreateGenerals < ActiveRecord::Migration[5.1]
  def change
    create_table :generals do |t|
      t.string :name
      t.string :kana
      t.string :sex
      t.date :birthday
      t.references :basic, foreign_key: true

      t.timestamps
    end
  end
end
