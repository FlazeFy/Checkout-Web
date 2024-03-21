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
end
