class CreateUserExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :user_experiences do |t|
      t.references :user, foreign_key: true
      t.text :experience

      t.timestamps
    end
  end
end
