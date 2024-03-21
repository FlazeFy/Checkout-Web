class CheckoutController < ApplicationController
  def index
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
  end
end
