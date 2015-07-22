class CreateWorkerSlMappings < ActiveRecord::Migration
  def change
    create_table :worker_sl_mappings do |t|
        t.references :worker, index: true, foreign_key: true
        t.references :locality, index: true, foreign_key: true
        t.integer :priority , default: 0        
      t.timestamps null: false
    end
  end
end
