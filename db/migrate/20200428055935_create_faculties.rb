class CreateFaculties < ActiveRecord::Migration[5.1]
  def change
    create_table :faculties do |t|
      t.references :university, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
