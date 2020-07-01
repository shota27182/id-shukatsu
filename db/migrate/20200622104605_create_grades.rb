class CreateGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :grades do |t|
      t.references :name, foreign_key: true

      t.timestamps
    end
  end
end
