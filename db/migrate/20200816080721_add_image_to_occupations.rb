class AddImageToOccupations < ActiveRecord::Migration[5.2]
  def change
    add_column :occupations, :image, :string
  end
end
