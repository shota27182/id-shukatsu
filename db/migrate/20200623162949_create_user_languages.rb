class CreateUserLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :user_languages do |t|
      t.references :user, foreign_key: true
      t.integer :language
      t.integer :level

      t.timestamps
    end
  end
end
