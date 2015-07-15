class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.number "serviceId" 
      t.string  "serviceName" 
      t.timestamps null: false
    end
  end
end
