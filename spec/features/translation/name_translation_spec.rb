# Feature: Translating your name
#   As a visitor
#   I want to get my name in Kanji
#   So I can order products and show off my love of Japanese style
feature 'Name translation' do
  scenario 'Entering a known name' do
    create(:source_name) do |source_name|
      source_name.transliterations.create(attributes_for(:transliteration))
    end

    visit root_path
    fill_in 'Your name', with: 'Mathew'
    click_on 'Create'
    expect(page).to have_content '魔臭'
  end

  scenario 'Entering an unknown name' do
    visit root_path
    fill_in 'Your name', with: 'Fhqwhgads'
    click_on 'Create'
    expect(page).to have_content 'Sorry'
    fill_in 'Email', with: 'mat@schaffer.me'
    click_on 'Let me know!'
    expect(page).to have_content 'Thanks'
  end

  scenario 'Entering a name with multiple transliterations' do
    create(:source_name) do |source_name|
      source_name.transliterations.create(attributes_for(:transliteration))
      source_name.transliterations.create(
          kanji: '魔秀',
          katakana: 'マシュー',
          romaji: 'mashu',
          explanation: 'magical, great'
      )
    end

    visit root_path
    fill_in 'Your name', with: 'Mathew'
    click_on 'Create'

    within("#main-transliteration") do
      expect(page).to have_content '魔臭'
    end

    expect(page).to have_content '魔秀'

    click_link'魔秀'

    within("#main-transliteration") do
      expect(page).to have_content '魔秀'
    end
  end
end
