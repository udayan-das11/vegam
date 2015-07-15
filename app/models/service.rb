class Service < ActiveRecord::Base
  has_many_and_belongs_to :localities
end
