class CreateUserReceives < ActiveRecord::Migration[5.2]
  def change
    create_table :user_receives do |t|
      t.integer :magazine
      t.integer :scout

      t.timestamps
    end
  end
end
