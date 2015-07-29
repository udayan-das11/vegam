class Worker < ActiveRecord::Base
  has_many :item_wh_transacs
  belongs_to :services
  belongs_to :cities
end
