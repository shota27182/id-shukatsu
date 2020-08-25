class CreateTeleworks < ActiveRecord::Migration[5.2]
  def change
    create_table :teleworks do |t|
      t.string :name

      t.timestamps
    end
  end
end
