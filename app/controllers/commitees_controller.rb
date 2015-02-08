class CommiteesController < InheritedResources::Base

  before_action :set_commitee, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
# GET /commitees
# GET /commitees.json
  def index
    @commitees = Commitee.all
    @votes = Vote.all
  end
# GET /commitees/1
# GET /commitees/1.json
  def show
    @commitee = Commitee.find(params[:id])

  end
# GET /commitees/new
  def new
    @commitee = Commitee.new
  end
# GET /commitees/1/edit
  def edit
  end
# POST /commitees
# POST /commitees.json
  def create
    @commitee = Commitee.new(commitee_params)
    respond_to do |format|
      if @commitee.save
        format.html { redirect_to @commitee, notice: 'Commitee was successfully created.' }
        format.json { render :show, status: :created, location: @commitee }
      else
        format.html { render :new }
        format.json { render json: @commitee.errors, status: :unprocessable_entity }
      end
    end
  end
# PATCH/PUT /commitees/1
# PATCH/PUT /commitees/1.json
  def update
    respond_to do |format|
      if @commitee.update(commitee_params)
        format.html { redirect_to @commitee, notice: 'Commitee was successfully updated.' }
        format.json { render :show, status: :ok, location: @commitee }
      else
        format.html { render :edit }
        format.json { render json: @commitee.errors, status: :unprocessable_entity }
      end
    end
  end
# DELETE /commitees/1
# DELETE /commitees/1.json
  def destroy
    @commitee.destroy
    respond_to do |format|
      format.html { redirect_to commitees_url, notice: 'Commitee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
# Use callbacks to share common setup or constraints between actions.
  def set_commitee
    @commitee = Commitee.find(params[:id])
  end
  def set_voivodeships
    @voivodeships = Voivodeship.all.map do |v|
      [v.name, v.id]
    end
  end

  def set_vote
    @vote = Vote.find(params[:id])
  end
# Never trust parameters from the scary internet, only allow the white list through.
  def commitee_params
    params.require(:commitee).permit(:name, :logo, :party, {:voivodeship_ids => []})
  end
end

