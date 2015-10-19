class Transliteration < ActiveRecord::Base
  belongs_to :source_name

  def name
    kanji
  end

  def explanation
    return super unless super.empty?
    "A mysterious, unexplained name we're furiously researching."
  end

  def generate_pdf(dir)
    filename = id
    length = kanji.length
    vertical_kanji = kanji.chars.join("\n")

    kanji_font = "#{Rails.root}/lib/epgyosho.ttf"

    generated_png = "#{Rails.root}/public/generated/#{filename}.png"

    generated_pdf = "#{dir}/#{filename}.pdf"

    Prawn::Document.generate(generated_pdf, page_size: [1000, 1000]) do
      font(kanji_font) do
        size = case length
                 when 1
                   900
                 when 2
                   460
                 when 3
                   300
               end
        text_box vertical_kanji, size: size, align: :center, valign: :center
      end
    end

    image = MiniMagick::Image.open(generated_pdf)
    image.format "png"

    image.write(generated_png)
    generated_png
  end
end
