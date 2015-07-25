class CreateServiceCityMappings < ActiveRecord::Migration
  def change
    create_table :service_city_mappings do |t|
      t.references :city, index: true, foreign_key: true
      t.references :service, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
