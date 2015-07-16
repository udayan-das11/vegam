class CreateItemWhTransacs < ActiveRecord::Migration
  def change
    create_table :item_wh_transacs do |t|
      t.integer :warehouse_id
      t.integer :item_id
      t.date :transac_date
      t.float :amount
      t.string :transac_type
      t.integer :reference_stockout_usage
      t.string :responsible_person

      t.timestamps
    end
  end
end
