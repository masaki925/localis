class Plan < ActiveRecord::Base
  attr_accessible :title
  belongs_to :request
  has_many :plan_days
end
