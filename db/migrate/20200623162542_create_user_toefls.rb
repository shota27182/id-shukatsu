class CreateUserToefls < ActiveRecord::Migration[5.2]
  def change
    create_table :user_toefls do |t|
      t.references :user, foreign_key: true
      t.integer :toefl
      t.integer :type

      t.timestamps
    end
  end
end
