class Plan < ActiveRecord::Base
  attr_accessible :title
  has_many :plan_spots
  has_many :spots, :through => :plan_spots
end
