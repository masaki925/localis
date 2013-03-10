class Spot < ActiveRecord::Base
  attr_accessible :name, :position
  has_many :plan_spots
  has_many :plans, :through => :plan_spots
end
