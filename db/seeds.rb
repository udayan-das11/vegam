# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   City = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: City.first)

 City.create({:cityName => 'Delhi' , :cityId => 1})
City.create({:cityName => 'Mumbai' , :cityId => 2})
 City.create({:cityName => 'Hyderabad' , :cityId => 3})
 City.create({:cityName =>  'Banglore' , :cityId => 4})
 City.create({:cityName => 'Gurgaon' , :cityId => 5})
 City.create({:cityName => 'Surat' , :cityId => 6})
 
 
 
 Service.create({:serviceName => 'Plumbing' , :serviceId => 1})
Service.create({:serviceName => 'Computer Repair' , :serviceId => 2})
 Service.create({:serviceName => 'Electircal' , :serviceId => 3})
 Service.create({:serviceName =>  'Beauty' , :serviceId => 4})
 Service.create({:serviceName => 'Fitnes' , :serviceId => 5})
 Service.create({:serviceName => 'Pest Control' , :serviceId => 6})
  