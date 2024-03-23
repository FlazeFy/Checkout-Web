class HistoryController < ApplicationController
  # Query
  def index
    @checkouts = Checkout.all().order(created_at: :desc)
  end

  # Command
  def destroy_checkout
    @checkout = Checkout.find(params[:id])
    @checkout.destroy

    redirect_to history_path, status: :see_other
  end
end
