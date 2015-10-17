class Transliteration < ActiveRecord::Base
  belongs_to :source_name

  def name
    kanji
  end
end
