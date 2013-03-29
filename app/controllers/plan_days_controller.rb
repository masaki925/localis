class PlanDaysController < ApplicationController
  def show
    @plan_day = PlanDay.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @plan_day }
    end
  end

  def cand_sort
    @plan_day = PlanDay.find( params[:id] )

    if params[:plan_spot]
      @spots = Spot.find( params[:plan_spot] )
      @plan_day.spots = @spots
    
      params['plan_spot'].each_with_index do |spot_id, idx|
        ps = PlanSpot.where( plan_day_id: @plan_day.id, spot_id: spot_id ).first
        ps.position = idx + 1
        ps.save
      end
    else
      @plan_day.spots = []
    end

    render :nothing => true
  end

  def edit
    @plan_day   = PlanDay.find(params[:id])
    @request = @plan_day.plan.request
    # TODO: キレイにする
    @candidate = Candidate.where( request_id: @request.id, user_id: current_user.id ).first

    # TODO: plan_spots は、plan_day_spots になる?
    @plan_spots = @plan_day.spots.order('plan_spots.position ASC')

    @cand_spots_all = @candidate.spots
    @cand_spots = @cand_spots_all - @plan_spots
  end
end
