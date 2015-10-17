class LookupsController < ApplicationController
  def index
  end

  def create
    redirect_to name_path(params[:lookup][:name].downcase)
  end
end
