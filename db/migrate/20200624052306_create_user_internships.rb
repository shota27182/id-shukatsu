class CreateUserInternships < ActiveRecord::Migration[5.2]
  def change
    create_table :user_internships do |t|
      t.references :user, foreign_key: true
      t.text :internship

      t.timestamps
    end
  end
end
