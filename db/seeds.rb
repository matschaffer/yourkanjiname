# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admins = %w(
  mat@schaffer.me
  riku@tanide.net
  privater.net@gmail.com
  yamanashi@axis-corp.com
  yamaneko3go@gmail.com
)

admins.each { |email| Admin.create!(email: email, password: 'abcd1234', password_confirmation: 'abcd1234') }

mathew = SourceName.create!(country: 'US', name: 'mathew')
mathew.transliterations.create!(kanji: '魔臭', katakana: 'マシュー', romaji: 'ma-shuu', explanation: 'Stink devil')
