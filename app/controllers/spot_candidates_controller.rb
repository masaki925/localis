class SpotCandidatesController < ApplicationController
  # GET /spot_candidates
  # GET /spot_candidates.json
  def index
    @spot_candidates = SpotCandidate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @spot_candidates }
    end
  end

  # GET /spot_candidates/1
  # GET /spot_candidates/1.json
  def show
    @spot_candidate = SpotCandidate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @spot_candidate }
    end
  end

  # GET /spot_candidates/new
  # GET /spot_candidates/new.json
  def new
    @spot_candidate = SpotCandidate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @spot_candidate }
    end
  end

  # GET /spot_candidates/1/edit
  def edit
    @spot_candidate = SpotCandidate.find(params[:id])
  end

  # POST /spot_candidates
  # POST /spot_candidates.json
  def create
    debugger
    @spot_candidate = SpotCandidate.new_for_localis( params[:spot_candidate], current_user )

    respond_to do |format|
      if @spot_candidate.save
        format.html { redirect_to @spot_candidate, notice: 'Spot candidate was successfully created.' }
        format.json { render json: @spot_candidate, status: :created, location: @spot_candidate }
      else
        format.html { render action: "new" }
        format.json { render json: @spot_candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /spot_candidates/1
  # PUT /spot_candidates/1.json
  def update
    @spot_candidate = SpotCandidate.find(params[:id])

    respond_to do |format|
      if @spot_candidate.update_attributes(params[:spot_candidate])
        format.html { redirect_to @spot_candidate, notice: 'Spot candidate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @spot_candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spot_candidates/1
  # DELETE /spot_candidates/1.json
  def destroy
    @spot_candidate = SpotCandidate.find(params[:id])
    @spot_candidate.destroy

    respond_to do |format|
      format.html { redirect_to spot_candidates_url }
      format.json { head :no_content }
    end
  end
end
