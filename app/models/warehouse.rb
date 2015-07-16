class Warehouse < ActiveRecord::Base
	has_many :item_wh_transacs
end
