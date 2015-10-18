desc 'generate a kanji image'
task image: :environment do
  name = "mathew"
  kanji = "鱒"


  Prawn::Document.generate("#{name}.pdf", page_size: [1000, 1000]) do
    font("#{Rails.root}/lib/epgyosho.ttf") do
      text_box kanji, size: 460, align: :center, valign: :center
    end
  end

  image = MiniMagick::Image.open("#{name}.pdf")
  image.format "png"
  image.write("public/#{name}.png")
end
