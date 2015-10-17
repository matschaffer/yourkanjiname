namespace :import do
  desc 'Get an auth token from google'
  task :auth do
    require 'google/api_client'
    require 'google_drive'

    client = Google::APIClient.new(application_name: "YourKanjiName", application_version: 1)
    auth = client.authorization
    auth.client_id = ENV["GOOGLE_CLIENT_ID"]
    auth.client_secret = ENV["GOOGLE_CLIENT_SECRET"]
    auth.scope = [
        "https://www.googleapis.com/auth/drive",
        "https://spreadsheets.google.com/feeds/"
    ]
    auth.redirect_uri = "urn:ietf:wg:oauth:2.0:oob"
    print("1. Open this page:\n%s\n\n" % auth.authorization_uri)
    print("2. Enter the authorization code shown in the page: ")
    auth.code = $stdin.gets.chomp
    auth.fetch_access_token!(:connection => client.connection)
    access_token = auth.access_token
    puts "Access token is: #{access_token}"
  end

  desc 'Imports names from our google doc'
  task names: :environment do
    country = 'US'

    access_token = ENV['GOOGLE_ACCESS_TOKEN']
    session = GoogleDrive.login_with_oauth(access_token)
    ws = session.spreadsheet_by_key("1Rq4Odoc0cgF11g2xfqHVtpo0DNzX_x3-b0_MK-V8VF4").worksheets[0]
    (2..ws.num_rows).each do |row|
      name = ws[row, 2].strip.downcase
      source_name = SourceName.find_or_create_by(name: name, country: country)
      transliteration_attributes = {
          katakana: ws[row, 3].strip,
          romaji: ws[row, 4].strip
      }

      3.times do |i|
        kanji = ws[row, 5+i*2].strip

        # remove some copy-paste junk not visibile in spreadsheet
        kanji = kanji.gsub("\b", '').gsub("\ufffd", '')

        explanation = ws[row, 6+i*2].strip
        unless kanji.empty?
          transliteration = source_name.transliterations.find_or_create_by(kanji: kanji)
          transliteration.update_attributes(transliteration_attributes.merge(explanation: explanation))
        end
      end
    end
  end
end
