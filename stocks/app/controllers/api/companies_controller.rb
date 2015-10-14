class Api::CompaniesController < ApplicationController

  before_action do
    request.format = :json
  end

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find params[:id]
  end
end
