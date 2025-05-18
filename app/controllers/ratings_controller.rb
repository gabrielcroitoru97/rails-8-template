class RatingsController < ApplicationController
  before_action :set_rating, only: %i[ show edit update destroy ]

  # GET /ratings or /ratings.json
  def index
    @ratings = Rating.all
  end

  # GET /ratings/1 or /ratings/1.json
  def show
  end

  # GET /ratings/new
  def new
    @rating = Rating.new
  end

  # GET /ratings/1/edit
  def edit
  end

  # POST /ratings or /ratings.json
  def create
    @rating = Rating.new(rating_params)

    the_work_location= WorkLocation.find(rating_params[:location_id])
    @rating.user = current_user

    the_work_location.average_rating = the_work_location.ratings.average(:overall_rating)
    the_work_location.wifi_speed_average = the_work_location.ratings.average(:wifi_rating)
    the_work_location.crowding_average = the_work_location.ratings.average(:crowding_rating)
    the_work_location.noise_average = the_work_location.ratings.average(:noise_rating)
    the_work_location.outlet_availability_average = the_work_location.ratings.average(:outlet_rating)
    #the_work_location.comfort_and_workspace_rating = the_work_location.ratings.average(:comfort_and_workspace_rating)
    the_work_location.save!

    respond_to do |format|
      if @rating.save
        format.html { redirect_to @rating, notice: "Rating was successfully created." }
        format.json { render :show, status: :created, location: @rating }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ratings/1 or /ratings/1.json
  def update
    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to @rating, notice: "Rating was successfully updated." }
        format.json { render :show, status: :ok, location: @rating }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ratings/1 or /ratings/1.json
  def destroy
    @rating.destroy!

    respond_to do |format|
      format.html { redirect_to ratings_path, status: :see_other, notice: "Rating was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def rating_params
      params.expect(rating: [ :user_id, :location_id, :overall_rating, :content, :wifi_rating, :crowding_rating, :noise_rating, :outlet_rating, :comfort_and_workspace_rating ])
    end
end
