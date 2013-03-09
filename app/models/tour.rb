class Tour < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :spots, :through => :spot_tours
end
