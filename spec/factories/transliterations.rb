FactoryGirl.define do
  factory :transliteration do
    association :source_name_id, :factory => :source_name
    kanji "魔臭"
    hiragana "ましゅう"
    romaji "ma-shuu"
    explanation "Stink devil"
  end
end
