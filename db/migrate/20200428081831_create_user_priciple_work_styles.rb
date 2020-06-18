class CreateUserPricipleWorkStyles < ActiveRecord::Migration[5.1]
  def change
    create_table :user_priciple_work_styles do |t|
      t.references :user_priciple, foreign_key: true
      t.references :work_style, foreign_key: true

      t.timestamps
    end
  end
end
