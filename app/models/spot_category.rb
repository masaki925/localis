class SpotCategory < ActiveRecord::Base
  attr_accessible :name
  has_many :spots
end
