class Activity < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :spots, :through => :spot_popular_activities
end
