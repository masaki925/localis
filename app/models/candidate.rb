class Candidate < ActiveRecord::Base
  attr_accessible :name
  belongs_to :spot
end
