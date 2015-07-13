class CreateContractors < ActiveRecord::Migration
  def change
    create_table :contractors do |t|
      t.string :name
      t.string :city
      t.string :subarea
      t.string :permaddr
      t.integer :phoneno
      t.string :email
      t.string :service
      t.string :contarctbasis
      t.string :status

      t.timestamps null: false
    end
  end
end
