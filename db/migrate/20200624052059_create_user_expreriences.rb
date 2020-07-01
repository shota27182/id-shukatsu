class CreateUserExpreriences < ActiveRecord::Migration[5.2]
  def change
    create_table :user_expreriences do |t|
      t.references :user, foreign_key: true
      t.text :experience

      t.timestamps
    end
  end
end
