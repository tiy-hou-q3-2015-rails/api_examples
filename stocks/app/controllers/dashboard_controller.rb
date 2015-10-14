class DashboardController < ApplicationController

  before_action :authenticate_user!

  def show
    @bids = Bid.where(open: true).all
  end
end
