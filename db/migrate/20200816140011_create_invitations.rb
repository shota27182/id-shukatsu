class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.integer :invite_id
      t.integer :invited_id

      t.timestamps
    end
    add_index :invitations, :invite_id
    add_index :invitations, :invited_id
    add_index :invitations, [:invite_id, :invited_id], unique: true
  end
end
