class Request < ActiveRecord::Base
  attr_accessible :budget_hotel, :budget_meal, :end_datetime, :people_num,
                  :start_datetime, :title, :username, :option_transport,
                  :option_edit, :option_pdf, :option_booking, :option_guide,
                  :option_qa, :deadline_datetime, :request_spots_attributes,
                  :request_hotels_attributes

  has_many :request_spots
  has_many :spots, :through => :request_spots
  accepts_nested_attributes_for :request_spots

  has_many :request_hotels
  has_many :spots, :through => :request_hotels
  accepts_nested_attributes_for :request_hotels
  has_many :candidates do
    def filter( user_id )
      find(:all, conditions: { user_id: user_id } )
    end
  end
  has_many :plans

  belongs_to :user


  # Alias for acts_as_taggable_on :tags
  acts_as_taggable
  acts_as_taggable_on :tags

  def days
    debugger
    self.start_datetime
    self.end_datetime
  end
end
