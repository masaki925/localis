class Candidate < ActiveRecord::Base
  attr_accessible :candidate_spots_attributes, :comment

  belongs_to :request
  belongs_to :user

  has_many :candidate_spots
  has_many :spots, :through => :candidate_spots
  accepts_nested_attributes_for :candidate_spots

  validates :request_id, presence: true
  validates :user_id, presence: true
end
