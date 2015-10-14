class Api::TransactionsController < ApplicationController

  protect_from_forgery with: :null_session

  before_action do
    request.format = :json
  end

  def create
    @sale = Sale.new params.require(:transaction).permit(:quantity, :price)
    @sale.company = Company.find params[:id]
    if @sale.save
      @sale.company.update(last_price: @sale.price)
      render status: 201, json: @sale
    else
      render status: 422, json: @sale.errors
    end
  end

end
