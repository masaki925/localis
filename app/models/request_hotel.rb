class RequestHotel < ActiveRecord::Base
  attr_accessible :end_datetime, :request_id, :spot_id, :start_datetime
  belongs_to :request
  belongs_to :spot
end
