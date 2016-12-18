class ApisController < ApplicationController

  def index
    @api = Api.first
    redirect_to api_path(@api)
  end

  def show
    @api = Api.find(params[:id])
  end
end
