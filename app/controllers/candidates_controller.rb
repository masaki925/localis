class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @candidates }
    end
  end

  def show
    @candidate = Candidate.find( params[:id] )

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @candidate }
    end
  end
end
