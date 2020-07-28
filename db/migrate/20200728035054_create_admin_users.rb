class CreateAdminUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_users do |t|
      t.string :email
      t.string :name
      t.string :activation_digest

      t.timestamps
    end
  end
end
