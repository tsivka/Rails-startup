class TreatmenttypesController < ApplicationController
  before_action :set_treatmenttype, only: [:show, :edit, :update, :destroy]

  # GET /treatmenttypes
  # GET /treatmenttypes.json
  def index
    @treatmenttypes = Treatmenttype.all
  end

  # GET /treatmenttypes/1
  # GET /treatmenttypes/1.json
  def show
  end

  # GET /treatmenttypes/new
  def new
    @treatmenttype = Treatmenttype.new
  end

  # GET /treatmenttypes/1/edit
  def edit
  end

  # POST /treatmenttypes
  # POST /treatmenttypes.json
  def create
    @treatmenttype = Treatmenttype.new(treatmenttype_params)

    respond_to do |format|
      if @treatmenttype.save
        format.html { redirect_to @treatmenttype, notice: 'Treatmenttype was successfully created.' }
        format.json { render :show, status: :created, location: @treatmenttype }
      else
        format.html { render :new }
        format.json { render json: @treatmenttype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /treatmenttypes/1
  # PATCH/PUT /treatmenttypes/1.json
  def update
    respond_to do |format|
      if @treatmenttype.update(treatmenttype_params)
        format.html { redirect_to @treatmenttype, notice: 'Treatmenttype was successfully updated.' }
        format.json { render :show, status: :ok, location: @treatmenttype }
      else
        format.html { render :edit }
        format.json { render json: @treatmenttype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treatmenttypes/1
  # DELETE /treatmenttypes/1.json
  def destroy
    @treatmenttype.destroy
    respond_to do |format|
      format.html { redirect_to treatmenttypes_url, notice: 'Treatmenttype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_treatmenttype
      @treatmenttype = Treatmenttype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def treatmenttype_params
      params.require(:treatmenttype).permit(:name)
    end
end
