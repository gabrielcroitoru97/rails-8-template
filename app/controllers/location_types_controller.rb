class LocationTypesController < ApplicationController
  before_action :set_location_type, only: %i[ show edit update destroy ]


  # GET /location_types/new
  def new
    @location_type = LocationType.new
  end

  # POST /location_types or /location_types.json
  def create
    @location_type = LocationType.new(location_type_params)

    respond_to do |format|
      if @location_type.save
        format.html { redirect_to @location_type, notice: "Location type was successfully created." }
        format.json { render :show, status: :created, location: @location_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @location_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location_types/1 or /location_types/1.json
  def destroy
    @location_type.destroy!

    respond_to do |format|
      format.html { redirect_to location_types_path, status: :see_other, notice: "Location type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location_type
      @location_type = LocationType.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def location_type_params
      params.expect(location_type: [ :descriptor ])
    end
end
