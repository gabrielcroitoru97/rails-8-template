class FavoritePlacesController < ApplicationController
  before_action :set_favorite_place, only: %i[ show edit update destroy ]

  # GET /favorite_places/new
  def new
    @favorite_place = FavoritePlace.new
  end

  # GET /favorite_places/1/edit
  def edit
  end

  # POST /favorite_places or /favorite_places.json
  def create
    @favorite_place = FavoritePlace.new(favorite_place_params)
    @favorite_place.user = current_user
    @the_work_location= WorkLocation.find(favorite_place_params[:place_id])

    respond_to do |format|
      if @favorite_place.save
        format.html { redirect_to @the_work_location, notice: "Favorite place was successfully created." }
        format.json { render :show, status: :created, location: @favorite_place }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @favorite_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favorite_places/1 or /favorite_places/1.json
  def update
    respond_to do |format|
      if @favorite_place.update(favorite_place_params)
        format.html { redirect_to @favorite_place, notice: "Favorite place was successfully updated." }
        format.json { render :show, status: :ok, location: @favorite_place }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @favorite_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorite_places/1 or /favorite_places/1.json
  def destroy
    work_location_id= @favorite_place.place_id
    @favorite_place.destroy!

    respond_to do |format|
      format.html { redirect_to WorkLocation.find(work_location_id), status: :see_other, notice: "Favorite place was successfully destroyed." }
      format.json { head :no_content }
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_place
      @favorite_place = FavoritePlace.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def favorite_place_params
      params.expect(favorite_place: [ :user_id, :place_id, :note ])
    end
end
