class CalendarController < ApplicationController
  # Query
  def index
    @checkouts = Checkout.all()
  end
end
