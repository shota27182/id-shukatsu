class CreateDepartments < ActiveRecord::Migration[5.1]
  def change
    create_table :departments do |t|
      t.references :faculty, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
