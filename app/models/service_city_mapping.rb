class ServiceCityMapping < ActiveRecord::Base
has_many :city  
   has_many :services

end
