class Service < ActiveRecord::Base
  has_and_belongs_to_many :localities
  has_many :sub_services
end
