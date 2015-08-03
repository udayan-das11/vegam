class ItemWhTransac < ActiveRecord::Base

	filterrific(
			default_filter_params: {  },
			available_filters: [
					:with_warehouse_id,
					:with_item_id,
					:with_transaction_type,
					:with_transaction_date_to,
					:with_transaction_date_from,
					:with_created_at_gte
			]
	)
	belongs_to :item
	belongs_to :warehouse
	belongs_to :worker
	self.per_page = 10
	scope :with_warehouse_id, lambda { |warehouse_ids|
					puts('$$$$$$$$$$$$$$$$#############')
													where(:warehouse_id => [*warehouse_ids])
		}
	scope :with_item_id, lambda { |item_ids|
														where(:item_id => [*item_ids])
													}
	scope :with_transaction_type, lambda { |transaction_types|
														where(:transac_type => [*transaction_types])
													}
	#scope :with_transaction_type, lambda { |transaction_types|
	#															where(:transac_type => [*transaction_types])
	#														}
	scope :with_transaction_type, lambda { |transaction_types|
																where('item_wh_transacs.transac_type = ?',transaction_types)
															}
	scope :with_transaction_date_from, lambda { |ref_date|
																where('ItemWhTransac.transac_date >= ?',ref_date)
															}
	scope :with_transaction_date_to, lambda { |ref_date|
																where('ItemWhTransac.transac_date <= ?',ref_date)
															}
end
