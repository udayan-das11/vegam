class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :password
      t.string :confirm_password
      t.string :phone
      t.string :email
      t.string :gender
      t.string :dob

      t.timestamps null: false
    end
  end
end
