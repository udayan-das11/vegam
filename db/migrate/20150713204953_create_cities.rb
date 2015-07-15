class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
  t.string "cityId" , :limit =>50 , :null => false
      t.string "cityName"   
    
      t.timestamps null: false
    end
   end


end
