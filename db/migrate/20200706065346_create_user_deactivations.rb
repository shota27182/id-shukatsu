class CreateUserDeactivations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_deactivations do |t|
      t.integer :user
      t.integer :leave_reason
      t.text :other_reason
      t.integer :improve_point
      t.text :other_point

      t.timestamps
    end
  end
end
