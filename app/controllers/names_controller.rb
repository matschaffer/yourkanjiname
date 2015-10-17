class NamesController < ApplicationController
  def show
    country = "US"
    @name = SourceName.where(country: country, name: params[:id].downcase).first
  end
end
