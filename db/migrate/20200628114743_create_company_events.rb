class CreateCompanyEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :company_events do |t|
      t.references :company, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
