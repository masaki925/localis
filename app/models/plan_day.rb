class PlanDay < ActiveRecord::Base
  attr_accessible :day, :plan_id, :position
  has_many :plan_spots
  has_many :spots, :through => :plan_spots, :order => :position
  belongs_to :plan

  def save_spots_with_position( spot_ids )
    self.spots = []

    spot_ids.each_with_index do |spot_id, idx|
      self.plan_spots << PlanSpot.new( plan_day_id: self.id,
                                       spot_id: spot_id,
                                       position: idx + 1
                                     )
    end
  end
end
