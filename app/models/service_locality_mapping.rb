class ServiceLocalityMapping < ActiveRecord::Base
  belongs_to :service
  belongs_to :city
  belongs_to :locality
end
