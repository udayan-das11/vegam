class AddPriceToItemWhTransac < ActiveRecord::Migration
  def change
    add_column :item_wh_transacs, :price, :float
  end
end
