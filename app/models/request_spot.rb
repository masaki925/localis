class RequestSpot < ActiveRecord::Base
  attr_accessible :request_id, :spot_id, :spot_attributes
  belongs_to :request
  belongs_to :spot
  accepts_nested_attributes_for :spot
end
