class ItemWhTransac < ActiveRecord::Base

	belongs_to :item
	belongs_to :warehouse
	belongs_to :worker

end
