class BidsController < ApplicationController
  def new
    @bid = Bid.new
    @holding = @current_user.portfolios.find params[:holding_id]
    @bid.company = @holding.company
    @bid.quantity = @holding.quantity
    @bid.price = @holding.company.last_price * 1.05
  end

  def create
    @bid = Bid.new params.require(:bid).permit(:quantity, :price, :company_id)
    @bid.user = @current_user
    if @bid.save
      redirect_to root_path
    else
      render :new
    end
  end
end
