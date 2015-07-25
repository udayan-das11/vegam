class ServiceCityMapping < ActiveRecord::Base
  belongs_to :city
  belongs_to :service
end
