class StatsController < ApplicationController
  before_action :set_stat, only: %i[ show edit update destroy ]

  # GET /stats or /stats.json
  def index
    cre = params[:cre]
    if !cre.nil?
      @createddate = Createddate.where(:id => cre)
      @stats = Stat.where(:createddate_id => cre)
      
    else
      @createddate = Createddate.all
      @stats = Stat.all
    end
  end

  # GET /stats/1 or /stats/1.json
  def show
  end

  # GET /stats/new
  def new
    @createddates = Createddate.all
    @stat = Stat.new
  end

  # GET /stats/1/edit
  def edit
    @createddates = Createddate.all
    @stats = Stat.find(params[:id])
  end

  # POST /stats or /stats.json
  def create
    cre = params[:cre]
    @createddates = Createddate.all
    
    @stat = Stat.new(stat_params)
    @stat.createddate_id = params[:createddate][:date]
    if @stat.save
      redirect_to stats_path(:cre => @stat.createddate_id)
    else
      render :new
    end

  end

  # PATCH/PUT /stats/1 or /stats/1.json
  def update
    @createddates = Createddate.all
    respond_to do |format|
      @createddates.each do |createddate|
      if @stat.update(stat_params)
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stat.errors, status: :unprocessable_entity }
      
      end
    end
    end
  end

  # DELETE /stats/1 or /stats/1.json
  def destroy
    @stat.destroy

    respond_to do |format|
      format.html { redirect_to root_url, notice: "Stat was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stat
      @stat = Stat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stat_params
      params.require(:stat).permit(:name, :score, :shot, :gb, :bd, :pc, :createddate_id)
    end
end
