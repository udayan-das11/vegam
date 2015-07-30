class CreateBookings < ActiveRecord::Migration
  def change
   create_table :bookings do |t|
      t.references :service_city_mapping, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :worker, index: true, foreign_key: true
      t.references :sub_service, index: true, foreign_key: true
      t.references :locality, index:true, foreign_key:true
      t.string :email
      t.string :phoneno
      t.string :name
      t.string :address
      t.integer :pin
      t.string :comments
      t.timestamps :schedule_at
      t.timestamps :created_at
      t.timestamps null: false
    end
  end
end
