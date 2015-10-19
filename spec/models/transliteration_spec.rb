require 'spec_helper'

describe Transliteration do
  let (:transliteration1) { create(:transliteration, kanji: '魔') }
  let (:transliteration2) { create(:transliteration, kanji: '魔臭') }
  let (:transliteration3) { create(:transliteration, kanji: '超魔臭') }

  let (:transliterations) { [ transliteration1, transliteration2, transliteration3 ]}

  it 'generates pdfs' do
    transliterations.each do |transliteration|
      expect(transliteration.generate_pdf).to match("#{transliteration.id}.png")
    end
  end
end

