class Request < ActiveRecord::Base
  attr_accessible :title
  has_many :plans
end
