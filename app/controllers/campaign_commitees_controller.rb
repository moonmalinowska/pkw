class CampaignCommiteesController < ApplicationController
  before_action :set_campaign_commitee, only: [:show, :edit, :update, :destroy]

  # GET /campaign_commitees
  # GET /campaign_commitees.json
  def index
    @campaign_commitees = CampaignCommitee.all
  end

  # GET /campaign_commitees/1
  # GET /campaign_commitees/1.json
  def show
  end

  # GET /campaign_commitees/new
  def new
    @campaign_commitee = CampaignCommitee.new
  end

  # GET /campaign_commitees/1/edit
  def edit
  end

  # POST /campaign_commitees
  # POST /campaign_commitees.json
  def create
    @campaign_commitee = CampaignCommitee.new(campaign_commitee_params)

    respond_to do |format|
      if @campaign_commitee.save
        format.html { redirect_to @campaign_commitee, notice: 'Campaign commitee was successfully created.' }
        format.json { render :show, status: :created, location: @campaign_commitee }
      else
        format.html { render :new }
        format.json { render json: @campaign_commitee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaign_commitees/1
  # PATCH/PUT /campaign_commitees/1.json
  def update
    respond_to do |format|
      if @campaign_commitee.update(campaign_commitee_params)
        format.html { redirect_to @campaign_commitee, notice: 'Campaign commitee was successfully updated.' }
        format.json { render :show, status: :ok, location: @campaign_commitee }
      else
        format.html { render :edit }
        format.json { render json: @campaign_commitee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaign_commitees/1
  # DELETE /campaign_commitees/1.json
  def destroy
    @campaign_commitee.destroy
    respond_to do |format|
      format.html { redirect_to campaign_commitees_url, notice: 'Campaign commitee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign_commitee
      @campaign_commitee = CampaignCommitee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_commitee_params
      params.require(:campaign_commitee).permit(:name, :logo, :party)
    end
end
