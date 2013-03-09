class SpotPopularMenu < ActiveRecord::Base
  attr_accessible :menu_id, :spot_id
  belongs_to :spot
  belongs_to :menu
end
