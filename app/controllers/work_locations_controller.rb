class WorkLocationsController < ApplicationController
  before_action :set_work_location, only: %i[ show edit update destroy ]

  # GET /work_locations or /work_locations.json
  def index
    @work_locations = WorkLocation.all
  end

  # GET /work_locations/1 or /work_locations/1.json
  def show
  end

  # GET /work_locations/new
  def new
    @work_location = WorkLocation.new
  end

  # GET /work_locations/1/edit
  def edit
  end

  # POST /work_locations or /work_locations.json
  def create
    @work_location = WorkLocation.new(work_location_params)
    @work_location.owner = current_user

    respond_to do |format|
      if @work_location.save
        format.html { redirect_to @work_location, notice: "Work location was successfully created." }
        format.json { render :show, status: :created, location: @work_location }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @work_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_locations/1 or /work_locations/1.json
  def update
    respond_to do |format|
      if @work_location.update(work_location_params)
        format.html { redirect_to @work_location, notice: "Work location was successfully updated." }
        format.json { render :show, status: :ok, location: @work_location }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @work_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_locations/1 or /work_locations/1.json
  def destroy
    @work_location.destroy!

    respond_to do |format|
      format.html { redirect_to work_locations_path, status: :see_other, notice: "Work location was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_location
      @work_location = WorkLocation.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def work_location_params
      params.expect(work_location: [ :location_type_id, :wifi_speed_average, :address, :phone_number, :website, :city, :state, :zip_code, :longitude, :latitude, :description, :name, :average_rating, :owner_id, :crowding_average, :noise_average, :requires_purchase, :membership, :sunday_opening_time, :monday_opening_time, :tuesday_opening_time, :wednesday_opening_time, :thursday_opening_time, :friday_opening_time, :saturday_opening_time, :sunday_closing_time, :monday_closing_time, :tuesday_closing_time, :wednesday_closing_time, :thursday_closing_time, :friday_closing_time, :saturday_closing_time, :sunday_closed, :monday_closed, :tuesday_closed, :wednesday_closed, :thursday_closed, :friday_closed, :saturday_closed, :outlet_availability_average ])
    end
end
