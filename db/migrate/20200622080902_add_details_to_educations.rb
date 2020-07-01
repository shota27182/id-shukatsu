class AddDetailsToEducations < ActiveRecord::Migration[5.2]
  def change
    add_column :educations, :university, :string
    add_column :educations, :faculty, :string
    add_column :educations, :department, :string
  end
end
