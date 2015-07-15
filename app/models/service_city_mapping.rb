class ServiceCityMapping < ActiveRecord::Base
  has_many :citys
   has_many :services
end
