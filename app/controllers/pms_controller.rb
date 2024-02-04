class PmsController < ApplicationController
  before_action :set_pm, only: %i[ show edit update destroy ]

  # GET /pms or /pms.json
  def index
    @pms = Pm.all
  end

  # GET /pms/1 or /pms/1.json
  def show
  end

  # GET /pms/new
  def new
    @pm = Pm.new
  end

  # GET /pms/1/edit
  def edit
  end

  # POST /pms or /pms.json
  def create
    @pm = Pm.new(pm_params)

    respond_to do |format|
      if @pm.save
        format.html { redirect_to pm_url(@pm), notice: "Pm was successfully created." }
        format.json { render :show, status: :created, location: @pm }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pms/1 or /pms/1.json
  def update
    respond_to do |format|
      if @pm.update(pm_params)
        format.html { redirect_to pm_url(@pm), notice: "Pm was successfully updated." }
        format.json { render :show, status: :ok, location: @pm }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pms/1 or /pms/1.json
  def destroy
    @pm.destroy

    respond_to do |format|
      format.html { redirect_to pms_url, notice: "Pm was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pm
      @pm = Pm.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pm_params
      params.require(:pm).permit(:subject, :desc, :user, :sender, :read, :torolt, :warn)
    end
end
