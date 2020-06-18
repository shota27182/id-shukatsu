class CreateWishes < ActiveRecord::Migration[5.1]
  def change
    create_table :wishes do |t|
      t.references :core, foreign_key: true

      t.timestamps
    end
  end
end
