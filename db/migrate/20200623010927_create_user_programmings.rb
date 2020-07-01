class CreateUserProgrammings < ActiveRecord::Migration[5.2]
  def change
    create_table :user_programmings do |t|
      t.references :user, foreign_key: true
      t.references :programming, foreign_key: true
      t.string :use_time
      t.text :description

      t.timestamps
    end
  end
end
