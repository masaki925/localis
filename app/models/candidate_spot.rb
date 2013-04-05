class CandidateSpot < ActiveRecord::Base
  attr_accessible :comment, :recommend, :spot_id, :spot_attributes

  belongs_to :candidate
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
