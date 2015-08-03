class Item < ActiveRecord::Base
	has_many :item_wh_transacs
	def self.options_for_select
		order('LOWER(name)').map { |e| [e.name, e.id] }
	end
	def self.options_for_transaction_type
		myarray = ['Stock In','Stock Out','Usage','Return','Initial','Adjustment','Purchase']
		return myarray
	end
end
