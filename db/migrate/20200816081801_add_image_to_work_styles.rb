class AddImageToWorkStyles < ActiveRecord::Migration[5.2]
  def change
    add_column :work_styles, :image, :string
  end
end
