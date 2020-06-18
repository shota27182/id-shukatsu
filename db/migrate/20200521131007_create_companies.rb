class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.text :introduction
      t.string :category
      t.integer :people
      t.string :url
      t.string :img
      t.date :establishment

      t.timestamps
    end
  end
end
