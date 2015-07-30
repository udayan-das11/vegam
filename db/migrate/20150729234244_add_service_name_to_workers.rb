class AddServiceNameToWorkers < ActiveRecord::Migration
  def change
    add_column :workers, :servicename, :string
  end
end
