class Request < ActiveRecord::Base
  attr_accessible :budget_hotel, :budget_meal, :end_datetime, :option_booking, :option_edit, :option_guide, :option_pdf, :option_qa, :option_transport, :people_num, :start_datetime, :title, :user_id
  has_many :spots, :through => :request_spots
  has_many :spots, :through => :request_hotels
  has_many :spots, :through => :spot_candidates
  has_many :plans

  belongs_to :user

  # Alias for acts_as_taggable_on :tags
  acts_as_taggable
  acts_as_taggable_on :spots
end
