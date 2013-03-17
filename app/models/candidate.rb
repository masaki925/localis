class Candidate < ActiveRecord::Base
  attr_accessible :name
  belongs_to :spot
  belongs_to :user
  belongs_to :request
end
