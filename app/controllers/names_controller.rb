class NamesController < ApplicationController
  def show
    country = "US"
    @entered_name = params[:id]
    @name = SourceName.where(country: country, name: @entered_name.downcase).first
    if @name
      @transliterations = @name.transliterations.to_a

      @transliteration = @transliterations.first
      @alternate_transliterations = @transliterations - [@transliteration]
    else
      render 'not_found', status: 404 if @name.nil?
    end
  end
end
