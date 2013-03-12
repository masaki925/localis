class Menu < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :spot_popular_menus
  has_many :spots, :through => :spot_popular_menus
end
