class HistoryController < ApplicationController
  def index
    @checkouts = Checkout.all().order(created_at: :desc)
  end
end
