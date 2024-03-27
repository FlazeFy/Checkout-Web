require 'csv'

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

  # Others
  def save_as_csv
    @checkouts = Checkout.all().order(created_at: :desc)

    @csv_data = CSV.generate(headers: true) do |csv|
      csv << ['id', 'checkout_type', 'checkout_desc', 'checkout_destination', 'checkout_origin']
      @checkouts.each do |dt|
        csv << [dt.id, dt.checkout_type, dt.checkout_desc, dt.checkout_destination, dt.checkout_origin]
      end
    end

    File.write("public/doc/#{Date.today}-Checkout Data.csv", @csv_data)

    redirect_to history_path, status: :see_other
  end
end
