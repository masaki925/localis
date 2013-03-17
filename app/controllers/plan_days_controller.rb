class PlanDaysController < ApplicationController
  # GET /plan_days
  # GET /plan_days.json
  def index
    @plan_days = PlanDay.where( plan_id: params[:plan_id] )

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @plan_days }
    end
  end

  def cand_sort
    @plan_day = PlanDay.find( params[:id] )
    @spots = Spot.find( params[:plan_spot] )
    @plan_day.spots = @spots

    params['plan_spot'].each_with_index do |spot_id, idx|
      ps = PlanSpot.where( plan_day_id: @plan.id, spot_id: spot_id ).first
      ps.position = idx + 1
      ps.save
    end

    render :nothing => true
  end

  # GET /plan_days/1
  # GET /plan_days/1.json
  def show
    @plan_day = PlanDay.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @plan_day }
    end
  end

  # GET /plan_days/new
  # GET /plan_days/new.json
  def new
    @plan_day = PlanDay.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @plan_day }
    end
  end

  # GET /plan_days/1/edit
  def edit
    @plan_day = PlanDay.find(params[:id])

    # TODO: request を絡ませて、candidates を絞り込む
    @candidates = Candidate.where( request_id: params[:request_id] )

    # TODO: plan_spots は、planday_spots になる?
    @plan_spots = @plan_day.spots.order('plan_spots.position ASC')

    @cand_spots_all = Spot.where( ["id in (?)", @candidates.map {|c| c.spot_id}] )
    @cand_spots = @cand_spots_all - @plan_spots
  end

  # POST /plan_days
  # POST /plan_days.json
  def create
    @plan_day = PlanDay.new(params[:plan_day])

    respond_to do |format|
      if @plan_day.save
        format.html { redirect_to @plan_day, notice: 'Plan day was successfully created.' }
        format.json { render json: @plan_day, status: :created, location: @plan_day }
      else
        format.html { render action: "new" }
        format.json { render json: @plan_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /plan_days/1
  # PUT /plan_days/1.json
  def update
    @plan_day = PlanDay.find(params[:id])

    respond_to do |format|
      if @plan_day.update_attributes(params[:plan_day])
        format.html { redirect_to @plan_day, notice: 'Plan day was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @plan_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plan_days/1
  # DELETE /plan_days/1.json
  def destroy
    @plan_day = PlanDay.find(params[:id])
    @plan_day.destroy

    respond_to do |format|
      format.html { redirect_to plan_days_url }
      format.json { head :no_content }
    end
  end
end
