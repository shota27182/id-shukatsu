class DropTableEventCancelUsers < ActiveRecord::Migration[5.2]
  def change
    drop_table :event_cancel_users
  end
end
