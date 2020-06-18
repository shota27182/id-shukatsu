class AddDetailsToUniversities < ActiveRecord::Migration[5.1]
  def change
    add_reference :universities, :user_join, foreign_key: true
  end
end
