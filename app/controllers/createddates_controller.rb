class CreateddatesController < ApplicationController
  before_action :set_createddate, only: %i[ show edit update destroy ]
 
  # GET /createddates or /createddates.json
  def index
    @createddates = Createddate.all
    @stats = Stat.all
  end

  # GET /createddates/1 or /createddates/1.json
  def show
    @createddates = Createddate.all
    cre = params[:cre]
    @stats = Stat.all
    if !cre.nil?
      @stats = Stat.where(createddate_id => cre)
    else
      @stats = Stat.all
    end
    # @stat = Stat.new(stat_params)
    # @stat.createddate_id = params[:createddate][:date]
  end

  # GET /createddates/new
  def new
    @createddate = Createddate.new
    # @createddate.stats.new
  end

  # GET /createddates/1/edit
  def edit
  end

  # POST /createddates or /createddates.json
  def create
    @createddate = Createddate.new(createddate_params)

    respond_to do |format|
      if @createddate.save
        format.html { redirect_to createddate_url(@createddate), notice: "Createddate was successfully created." }
        format.json { render :show, status: :created, location: @createddate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @createddate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /createddates/1 or /createddates/1.json
  def update
    respond_to do |format|
      if @createddate.update(createddate_params)
        format.html { redirect_to createddate_url(@createddate), notice: "Createddate was successfully updated." }
        format.json { render :show, status: :ok, location: @createddate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @createddate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /createddates/1 or /createddates/1.json
  def destroy
    @createddate.destroy

    respond_to do |format|
      format.html { redirect_to createddates_url, notice: "Createddate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_createddate
      @createddate = Createddate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def createddate_params
      params.require(:createddate).permit(:date)
    end
end
