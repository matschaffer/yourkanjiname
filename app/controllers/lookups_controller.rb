class LookupsController < ApplicationController
  def index
    @lookup = Lookup.new
  end

  def create
    redirect_to name_path(params[:lookup][:name].downcase)
  end
end
