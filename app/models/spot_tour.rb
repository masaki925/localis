class SpotTour < ActiveRecord::Base
  attr_accessible :spot_id, :tour_id
  belongs_to :spot
  belongs_to :tour
end
