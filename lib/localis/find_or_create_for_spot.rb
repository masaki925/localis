module Localis
  module FindOrCreateForSpot
    def find_or_create_spot
      if new_spot = Spot.where(name: spot.name).first
        self.spot = new_spot
      else
        self.spot.save!
      end
    end
  end
end
