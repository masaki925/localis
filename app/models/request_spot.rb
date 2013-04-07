class RequestSpot < ActiveRecord::Base
  attr_accessible :request_id, :spot_id, :spot_attributes

  belongs_to :request
  belongs_to :spot, :autosave => true
  accepts_nested_attributes_for :spot

  def autosave_associated_records_for_spot
    if new_spot = Spot.where(name: spot.name).first
      self.spot = new_spot
    else
      self.spot = spot if self.spot.save!
    end
  end
end
