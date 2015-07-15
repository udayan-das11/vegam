class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :name
      t.string :city
      t.string :subcity
      t.string :peramadd
      t.string :phoneno
      t.string :email
      t.string :service
      t.string :contractbasis
      t.string :status

      t.timestamps null: false
    end
  end
end
