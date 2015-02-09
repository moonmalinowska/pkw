class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]
  before_action :set_districts, only: [:new, :edit, :update, :create]
  before_action :set_commitees, only: [:new, :edit, :update, :create]
  load_and_authorize_resource :only => [:index, :show, :edit, :update]

  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all
    @commitees = Commitee.all

  end

  # GET /votes/1
  # GET /votes/1.json
  def show
    @vote = Vote.find(params[:id])
  end

  # GET /votes/new
  def new
    @vote = Vote.new
  end

  # GET /votes/1/edit
  def edit

  end

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(vote_params)

    respond_to do |format|
      if @vote.save
        format.html { redirect_to @vote, notice: 'Vote was successfully created.' }
        format.json { render :show, status: :created, location: @vote }
      else
        format.html { render :new }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
=begin
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
        format.json { render :show, status: :ok, location: @vote }
      else
        format.html { render :edit }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
=end

    if @vote.update(vote_params)
      flash[:notice] = 'Dane zostały zmienione!'
      redirect_to @vote
    else
      render :action => 'edit'
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to votes_url, notice: 'Vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.require(:vote).permit(:vote, :district_id, :commitee_id)
    end

  def set_districts
    @districts = District.all.map do |district|
      [district.name + ' ' + district.voivodship.name, district.id]
    end
  end

  def set_commitees
    commitees = Commitee.all.map do |commitee|
      [commitee.name + ' ' + commitee.voivodships.name, commitee.id]
    end
  #  d = District.find_by_id(current_user.district_id)
  #  @commitees = d.voivodship.committees.map do |c|
  #    [c.name, c.id]
  #  end
  end
  #def valid_votes
  #  self.votes.count
  #end
  #def valid_votes
  #  valid = self.vote.inject(0){|s,v| s + v.vote }
  #end
end
