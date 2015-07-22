class WorkerSlMapping < ActiveRecord::Base
has_many :workers
has_many :localities
end
