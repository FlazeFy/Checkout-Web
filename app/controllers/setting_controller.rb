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

  def create_place
    @data = Place.new(
      place_category: params[:place_category].downcase, 
      place_name: params[:place_name],
      created_by: "1"
    )

    if @data.save
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
