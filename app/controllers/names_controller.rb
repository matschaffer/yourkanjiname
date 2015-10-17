class NamesController < ApplicationController
  def show
    country = "US"
    @entered_name = params[:id]
    @name = SourceName.where(country: country, name: @entered_name.downcase).first
  end
end
