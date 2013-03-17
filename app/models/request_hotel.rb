class RequestHotel < ActiveRecord::Base
  attr_accessible :end_datetime, :request_id, :spot_id, :start_datetime, :spot_attributes
  belongs_to :request
  belongs_to :spot
  accepts_nested_attributes_for :spot
end
