class Spot < ActiveRecord::Base
  attr_accessible :address, :cost, :name, :spot_category_id, :station,
                  :take_time, :tel, :google_reference
  has_many :spot_candidates
  has_many :user, :through => :spot_candidates

  has_many :request_spots
  has_many :requests, :through => :request_spots
  has_many :request_hotels
  has_many :requests, :through => :request_hotels
  has_many :spot_candidates
  has_many :requests, :through => :spot_candidates

  has_many :plan_spots
  has_many :plan_days, :through => :plan_spots

  has_many :spot_popular_activities
  has_many :activities, :through => :spot_popular_activities
  has_many :spot_popular_menus
  has_many :menus, :through => :spot_popular_menus
  has_many :spot_tours
  has_many :tours, :through => :spot_tours

  belongs_to :spot_category

  validates :name,             presence: true
  validates :google_reference, presence: true

  def self.create_unless_exist( spot_param )
    spot_name      = spot_param['name']
    spot_name_gref = spot_param['name_gref']

    spot = self.where( google_reference: spot_name_gref )
    if spot.empty?
      self.create( { name: spot_name, google_reference: spot_name_gref } )
    end
  end
end
