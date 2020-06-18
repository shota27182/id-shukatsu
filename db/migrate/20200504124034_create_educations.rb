class CreateEducations < ActiveRecord::Migration[5.1]
  def change
    create_table :educations do |t|
      t.string :grade
      t.date :graduation
      t.string :classification
      t.text :seminar
      t.string :highschool
      t.references :user, foreign_key: true
      t.references :university, foreign_key: true
      t.references :faculty, foreign_key: true
      t.references :department, foreign_key: true
      t.references :basic, foreign_key: true

      t.timestamps
    end
  end
end
