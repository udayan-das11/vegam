class City < ActiveRecord::Base
  has_many :localities
  has_many :worker
end
