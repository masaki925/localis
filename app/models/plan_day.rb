class PlanDay < ActiveRecord::Base
  attr_accessible :day, :plan_id
  has_many :spots, :through => :plan_spots
  belongs_to :plan
end
