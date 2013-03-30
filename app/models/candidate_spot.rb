class CandidateSpot < ActiveRecord::Base
  attr_accessible :comment, :recommend, :spot_id, :spot_attributes

  belongs_to :candidate
  belongs_to :spot
  accepts_nested_attributes_for :spot
end
