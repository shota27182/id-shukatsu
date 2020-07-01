class Wish < ActiveRecord::Migration[5.2]
  def change
    drop_table :wishes
  end
end
