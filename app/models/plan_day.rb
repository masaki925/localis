class PlanDay < ActiveRecord::Base
  attr_accessible :day, :plan_id
  has_many :plan_spots
  has_many :spots, :through => :plan_spots, :order => :position
  belongs_to :plan

  def unselected_candidates( request, user )
    candidate = Candidate.where( request_id: request.id, user_id: user.id ).first
    if candidate
      candidate.spots - self.spots
    else
      []
    end
  end
end
