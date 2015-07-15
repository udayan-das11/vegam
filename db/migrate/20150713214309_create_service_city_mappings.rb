class CreateServiceCityMappings < ActiveRecord::Migration
  def change
    create_table :service_city_mappings do |t|

      t.timestamps null: false
    end
  end
end
