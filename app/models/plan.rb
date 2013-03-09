class Plan < ActiveRecord::Base
  attr_accessible :title
  has_many :spots
end
