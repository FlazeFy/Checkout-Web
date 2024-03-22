class CheckoutController < ApplicationController
  # Query
  def index
    @dct_checkout_type = 
      Dictionary.where(dictionary_type: 'checkout_type')
                .order(created_at: :desc)
                .select(:dictionary_name)
    @origin = 
      Place.where(place_category: 'origin')
            .order(created_at: :desc)
            .select(:place_name)
    @destination = 
      Place.where(place_category: 'destination')
            .order(created_at: :desc)
            .select(:place_name)
  end

  # Command
  def new
    @data = Checkout.new
  end

  def create_checkout
    @data = Checkout.new(
      checkout_type: params[:checkout_type], 
      checkout_desc: params[:checkout_desc], 
      checkout_destination: params[:checkout_destination], 
      checkout_origin: params[:checkout_origin], 
      created_by: "1"
    )

    if @data.save
      redirect_to '/history'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def checkout_params
    params.require(:checkout).permit(
      :checkout_type, :checkout_desc, :checkout_destination, :checkout_origin
    )
  end
end
