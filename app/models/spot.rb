class Spot < ActiveRecord::Base
  attr_accessible :name, :position
  belongs_to :plan
end
