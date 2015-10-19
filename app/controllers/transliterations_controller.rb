class TransliterationsController < ApplicationController
  def show
    @transliteration = Transliteration.find(params[:id])
    @name = @transliteration.source_name
    @entered_name = @name.name.capitalize
    @transliterations = @name.transliterations.to_a
    @alternate_transliterations = @transliterations - [@transliteration]

    if params[:for] == "zazzle"
      render_for_zazzle
    else
      render 'names/show'
    end
  end

  private

  def render_for_zazzle
    Dir.mktmpdir do |dir|
      send_file @transliteration.generate_pdf(dir)
    end
  end
end
