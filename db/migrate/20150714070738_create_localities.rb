class CreateLocalities < ActiveRecord::Migration
  def change
    create_table :localities do |t|
      t.string :subCity
      t.string :rate
      t.references :city, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
