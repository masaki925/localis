class PlanSpot < ActiveRecord::Base
  attr_accessible :comment, :order, :plan_day_id, :spot_id, :timetogo
  belongs_to :plan_day
  belongs_to :spot
  acts_as_list scope: :plan_day
end
