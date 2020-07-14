class CreateCancelUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :cancel_users do |t|
      t.integer :user
      t.integer :event

      t.timestamps
    end
  end
end
