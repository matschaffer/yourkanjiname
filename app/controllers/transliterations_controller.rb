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
    filename = @transliteration.id
    kanji = @transliteration.kanji.chars.join("\n")

    kanji_font = "#{Rails.root}/lib/epgyosho.ttf"

    generated_png = "#{Rails.root}/public/generated/#{filename}.png"

    Dir.mktmpdir do |dir|
      generated_pdf = "#{dir}/#{filename}.pdf"

      Prawn::Document.generate(generated_pdf, page_size: [1000, 1000]) do
        font(kanji_font) do
          text_box kanji, size: 460, align: :center, valign: :center
        end
      end

      image = MiniMagick::Image.open(generated_pdf)
      image.format "png"
      
      image.write(generated_png)
      send_file generated_png
    end

  end
end
