class Booking < ActiveRecord::Base
belongs_to :service_city_mapping
belongs_to :user
belongs_to :worker
belongs_to :sub_service
belongs_to :locality
end
