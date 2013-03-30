class CandidateSpot < ActiveRecord::Base
  attr_accessible :comment, :recommend, :spot_id, :spot_attributes

  belongs_to :candidate
  belongs_to :spot
  accepts_nested_attributes_for :spot

  include Localis::FindOrCreateForSpot
  def autosave_associated_records_for_spot
    find_or_create_spot
  end
end
