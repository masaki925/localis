class SpotPopularActivity < ActiveRecord::Base
  attr_accessible :activity_id, :spot_id
  belongs_to :spot
  belongs_to :activity
end
