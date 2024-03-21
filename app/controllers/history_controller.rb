class HistoryController < ApplicationController
  def index
    def index
      @checkouts = Checkout.all()
    end
  end
end
