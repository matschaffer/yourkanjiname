class Transliteration < ActiveRecord::Base
  belongs_to :source_name

  def name
    kanji
  end

  def explanation
    return super unless super.empty?
    'A mysterious, unexplained name.'
  end
end
