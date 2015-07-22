class CreateSubServices < ActiveRecord::Migration
  def change
    create_table :sub_services do |t|
      t.string :subServiceName
      t.references :service, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
