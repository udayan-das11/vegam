class Warehouse < ActiveRecord::Base
	has_many :item_wh_transacs
	def self.options_for_select
		order('LOWER(name)').map { |e| [e.name, e.id] }
	end
end
