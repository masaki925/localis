class PlanSpot < ActiveRecord::Base
  belongs_to :plan
  belongs_to :spot
  # attr_accessible :title, :body
end
