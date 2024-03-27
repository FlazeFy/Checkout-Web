require 'csv'

class SettingController < ApplicationController
  def index
    @origin = 
      Place.where(place_category: 'origin')
            .order(place_name: :desc)
            .select(:place_name, :created_at, :id)
    @destination = 
      Place.where(place_category: 'destination')
            .order(place_name: :desc)
            .select(:place_name, :created_at, :id)
    @dct_checkout_type = 
      Dictionary.where(dictionary_type: 'checkout_type')
            .order(dictionary_name: :desc)
            .select(:dictionary_name, :id, :created_at)
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

  def destroy_dct
    @dct = Dictionary.find(params[:id])
    @dct.destroy

    redirect_to setting_path, status: :see_other
  end

  def create_place
    # Attribute
    @place_name = params[:place_name]
    @clean_name = @place_name.gsub(' ', '').downcase
    @found = false
    @check = Place.where(place_category: 'origin')
          .or(Place.where(place_category: 'destination'))
          .select("LOWER(REPLACE(place_name, ' ', '')) as place_name, place_category")

    if params[:place_category] != 'Origin & Destination'
      # Check availableness
      @check.each do |dt|
        if dt.place_name == @clean_name && dt.place_category == params[:place_category].downcase
          @found = true
        end
      end

      # Create
      if @found == false 
        @data = Place.create(
          place_category: params[:place_category].downcase, 
          place_name: @place_name,
          created_by: "1"
        )
      else 
        render :new, status: :unprocessable_entity
      end
    else 
      # Check availableness
      @category_fill = []
      @category_founded = nil
      @check.each do |dt|
        if dt.place_name == @clean_name
          @found = true

          if dt.place_category == 'origin' 
            @category_fill << 'destination'
          else dt.place_category == 'destination' 
            @category_fill << 'origin'
          end
        end
      end
      
      # Create
      if @found && @category_fill.size == 1
        @data = Place.create(
          place_category: @category_fill[0], 
          place_name: @place_name,
          created_by: "1"
        )
      elsif !@found && @category_fill.size != 2
        @data = [
          { 
            place_category: 'origin', 
            place_name: @place_name, 
            created_by: "1" 
          },
          { 
            place_category: 'destination', 
            place_name: @place_name, 
            created_by: "1" 
          }
        ]

        Place.create(@data)
      else 
        render :new, status: :unprocessable_entity
      end
    end
  
    # Exec
    if @data.present?
      redirect_to setting_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def create_dct
    # Attribute
    @dct_name = params[:dictionary_name]
    @dct_type = params[:dictionary_type]

    @clean_name = @dct_name.gsub(' ', '').downcase
    @found = false
    @check = Dictionary.where(dictionary_type: @dct_type)
          .select("LOWER(REPLACE(dictionary_name, ' ', '')) as dictionary_name")

    # Check availableness
    @check.each do |dt|
      if dt.dictionary_name == @clean_name
        @found = true
      end
    end

    # Create
    if @found == false 
      @data = Dictionary.create(
        dictionary_name: @dct_name, 
        dictionary_type: @dct_type,
      )
    else 
      render :new, status: :unprocessable_entity
    end
  
    # Exec
    if @data.save
      redirect_to setting_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Others
  def save_place_as_csv
    @places = Place.all().order(place_name: :desc)

    @csv_data = CSV.generate(headers: true) do |csv|
      csv << ['id', 'place_category', 'place_name']
      @places.each do |dt|
        csv << [dt.id, dt.place_category, dt.place_name]
      end
    end

    File.write("public/doc/#{Date.today}-Place Data.csv", @csv_data)

    redirect_to setting_path, status: :see_other
  end 

  private
  def place_params
    params.require(:place).permit(
      :place_category, :place_name
    )
  end

  def dictionary_params
    params.require(:place).permit(
      :dictionary_type, :dictionary_name
    )
  end
end
