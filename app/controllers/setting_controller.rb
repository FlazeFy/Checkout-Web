class SettingController < ApplicationController
  def index
    @origin = 
      Place.where(place_category: 'origin')
            .order(created_at: :desc)
            .select(:place_name, :created_at, :id)
    @destination = 
      Place.where(place_category: 'destination')
            .order(created_at: :desc)
            .select(:place_name, :created_at, :id)
  end

  # Command
  def new
    @data = Place.new
  end

  def destroy_place
    @place = Place.find(params[:id])
    @place.destroy

    redirect_to setting_path, status: :see_other
  end

  def create_place
    if params[:place_category] != 'Origin & Destination'
      @data = Place.create(
        place_category: params[:place_category].downcase, 
        place_name: params[:place_name],
        created_by: "1"
      )
    else 
      @data = [
        { place_category: 'origin', place_name: params[:place_name], created_by: "1" },
        { place_category: 'destination', place_name: params[:place_name], created_by: "1" }
      ]
      Place.create(@data)
    end
  
    if @data.present?
      redirect_to '/setting'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def place_params
    params.require(:place).permit(
      :place_category, :place_name
    )
  end
end
