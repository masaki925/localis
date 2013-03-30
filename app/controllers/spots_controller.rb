class SpotsController < ApplicationController
  def new
    @spot = Spot.new
  end

  def create_unless_exist
    @spot = Spot.create_unless_exist(params[:spot])
  end
end
