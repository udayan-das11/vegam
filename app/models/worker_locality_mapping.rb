class WorkerLocalityMapping < ActiveRecord::Base
  belongs_to :worker
  belongs_to :locality
end
