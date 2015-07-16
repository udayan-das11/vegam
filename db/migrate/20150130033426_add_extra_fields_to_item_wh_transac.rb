class AddExtraFieldsToItemWhTransac < ActiveRecord::Migration
  def change
    add_column :item_wh_transacs, :destination, :integer
    add_column :item_wh_transacs, :note, :string
  end
end
