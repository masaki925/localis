class PlanSpot < ActiveRecord::Base
  belongs_to :plan_day
  belongs_to :spot
  # attr_accessible :title, :body
  acts_as_list scope: :plan_day
end
