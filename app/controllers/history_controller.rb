class HistoryController < ApplicationController
  def index
    def index
      @checkouts = Checkout.all().order(created_at: :desc)
    end
  end
end
