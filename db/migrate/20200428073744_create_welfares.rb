class CreateWelfares < ActiveRecord::Migration[5.1]
  def change
    create_table :welfares do |t|
      t.string :name

      t.timestamps
    end
  end
end
