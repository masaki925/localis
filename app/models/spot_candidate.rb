class SpotCandidate < ActiveRecord::Base
  attr_accessible :request_id, :spot_id, :user_id, :comments, :recommendation_text
  belongs_to :user
  belongs_to :spot
  belongs_to :request
end
