class PlanDay < ActiveRecord::Base
  attr_accessible :day
  belongs_to :plan
  has_many :plan_spots
  has_many :spots, :through => :plan_spots
end
