class PlanDaysController < ApplicationController
  def show
    @plan_day = PlanDay.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @plan_day }
    end
  end

  def edit
    @plan_day   = PlanDay.find(params[:id])
    @request = @plan_day.plan.request

    @plan_spots = @plan_day.spots.order('plan_spots.position ASC')

    cand = Candidate.where( request_id: @request.id, user_id: current_user.id ).first
    @unselected_spots = cand.nil? ? [] : (cand.spots - @plan_spots)
    @selected_spots   = @plan_spots  # 便宜上 代入
  end

  def update
    @plan_day = PlanDay.find( params[:id] )

    if params[:plan_spot]
      @plan_day.save_spots_with_position( params[:plan_spot] )
    else
      @plan_day.spots = []
    end

    redirect_to plan_day_path( @plan_day )
  end
end
