require 'spec_helper'

describe Transliteration do
  let (:transliteration1) { create(:transliteration, kanji: '魔') }
  let (:transliteration2) { create(:transliteration, kanji: '魔臭') }
  let (:transliteration3) { create(:transliteration, kanji: '超魔臭') }

  it 'generates pdfs' do
    Dir.mktmpdir do |dir|
      expect(transliteration1.generate_pdf(dir)).to match('1.png')
      expect(transliteration2.generate_pdf(dir)).to match('2.png')
      expect(transliteration3.generate_pdf(dir)).to match('3.png')
    end
  end
end

