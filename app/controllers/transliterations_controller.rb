class TransliterationsController < ApplicationController
  def show
    @transliteration = Transliteration.find(params[:id])
    @name = @transliteration.source_name
    @entered_name = @name.name.capitalize
    @transliterations = @name.transliterations.to_a
    @alternate_transliterations = @transliterations - [@transliteration]
    render 'names/show'
  end
end
