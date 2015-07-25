class CreateServiceLocalityMappings < ActiveRecord::Migration
  def change
    create_table :service_locality_mappings do |t|
      t.references :service, index: true, foreign_key: true
      t.references :city, index: true, foreign_key: true
      t.references :locality, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
