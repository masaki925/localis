class CandidatesController < ApplicationController
  before_filter :require_authentication

  # GET /candidates
  # GET /candidates.json
  def index
    @candidates      = Candidate.all
    @candidates_mine = Candidate.where( request_id: params[:request_id], user_id: current_user )

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @candidates }
    end
  end

  # GET /candidates/1
  # GET /candidates/1.json
  def show
    @candidate = Candidate.find(params[:id])
    @request = @candidate.request

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @candidate }
    end
  end

  # GET /candidates/new
  # GET /candidates/new.json
  def new
    @request   = Request.find( params[:request_id] )
    if already_have_candidate = Candidate.where( user_id: current_user.id, request_id: @request.id ).first
      redirect_to edit_candidate_path( already_have_candidate )
      return
    end

    @candidate = Candidate.new
    @requested_spots = @request.spots

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @candidate }
    end
  end

  # GET /candidates/1/edit
  def edit
    @candidate = Candidate.find(params[:id])
    @request   = @candidate.request
  end

  # POST /candidates
  # POST /candidates.json
  def create
    @candidate = Candidate.new(params[:candidate])
    @candidate.user = current_user
    @candidate.request_id = params[:request_id]

    respond_to do |format|
      if @candidate.save
        @candidate.candidate_spots << params[:requested_spots].map { |spot_id|
          CandidateSpot.new( spot_id: spot_id,
                             recommend: 'requested from traveler' ) }

        format.html { redirect_to @candidate, notice: 'Candidate was successfully created.' }
        format.json { render json: @candidate, status: :created, location: @candidate }
      else
        format.html { render action: "new" }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /candidates/1
  # PUT /candidates/1.json
  def update
    @candidate = Candidate.find(params[:id])

    respond_to do |format|
      if @candidate.update_attributes(params[:candidate])
        format.html { redirect_to @candidate, notice: 'Candidate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidates/1
  # DELETE /candidates/1.json
  def destroy
    @candidate = Candidate.find(params[:id])
    @candidate.destroy

    respond_to do |format|
      format.html { redirect_to candidates_url }
      format.json { head :no_content }
    end
  end
end
