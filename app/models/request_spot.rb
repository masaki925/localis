class RequestSpot < ActiveRecord::Base
  attr_accessible :request_id, :spot_id
  belongs_to :request
  belongs_to :spot
end
