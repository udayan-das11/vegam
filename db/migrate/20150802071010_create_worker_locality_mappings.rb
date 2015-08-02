class CreateWorkerLocalityMappings < ActiveRecord::Migration
  def change
    create_table :worker_locality_mappings do |t|
      t.references :worker, index: true, foreign_key: true
      t.references :locality, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
