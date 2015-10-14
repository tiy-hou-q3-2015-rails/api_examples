class TransactionsController < ApplicationController


  before_action :authenticate_user!

  def create
    @bid = Bid.find params[:id]
    Sale.create!  company: @bid.company,
                  user: @current_user,
                  bid: @bid,
                  quantity: @bid.quantity,
                  price: @bid.price
    @bid.company.update last_price: @bid.price
    # take money out of buyer balance
    # if we have a IBM portfolio, increase quantity

    if @current_user.portfolios.find_by company_id: @bid.company.id
      holding = @current_user.portfolios.find_by company_id: @bid.company.id
      holding.update quantity: (holding.quantity + @bid.quantity)
    else
      @current_user.portfolios.create company: @bid.company, quantity: @bid.quantity
    end
    @current_user.update balance:  (@current_user.balance - (@bid.quantity * @bid.price))
    # Give that money to the seller
    @bid.user.update balance:  (@bid.user.balance + (@bid.quantity * @bid.price))

    # transfer to bwo from jwo
    # TODO: only remove from portfolio, don't delete unless quanity is 0
    seller_holdings = @bid.user.portfolios.find_by company_id: @bid.company.id
    seller_holdings.update quantity: (seller_holdings.quantity - @bid.quantity)
    if seller_holdings.quantity == 0
      seller_holdings.destroy
    end

    # close the bid
    @bid.update open: false

    redirect_to root_path


  end

end
