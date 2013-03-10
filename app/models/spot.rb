class Spot < ActiveRecord::Base
  attr_accessible :name, :position
  belongs_to :plan
  belongs_to :candidate
  acts_as_list :scope => :plan
end
