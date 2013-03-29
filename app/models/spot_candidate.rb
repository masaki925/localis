class SpotCandidate < ActiveRecord::Base
  attr_accessible :request_id, :spot_id, :user_id, :comments, :recommendation_text
  belongs_to :user
  belongs_to :request

  has_many :spot
  accepts_nested_attributes_for :spots

  def self.new_for_localis( params, user )
  end
end
