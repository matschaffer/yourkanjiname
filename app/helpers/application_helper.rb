module ApplicationHelper
  def zazzle_link(name, transliteration)
    image = source_name_transliteration_url(name, transliteration, for: :zazzle)
    escaped = URI.escape(image, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
    "http://www.zazzle.com/api/create/at-238743306077716923?rf=238743306077716923&ax=Linkover&pd=235501125229053056&fwd=ProductPage&ed=true&tc=&ic=&t_kanji_iid=" + escaped
  end
end
