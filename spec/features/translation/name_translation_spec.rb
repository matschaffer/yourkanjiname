# Feature: Translating your name
#   As a visitor
#   I want to get my name in Kanji
#   So I can order products and show off my love of Japanese style
feature 'Name translation' do
  before(:each) do
    create(:source_name) do |source_name|
      source_name.transliterations.create(attributes_for(:transliteration))
    end
  end

  scenario 'Entering a known name' do
    visit root_path
    fill_in 'Your name', with: 'Mathew'
    click_button 'Create'
    expect(page).to have_content '魔臭'
  end

  scenario 'Entering an unknown name' do
    visit root_path
    fill_in 'Your name', with: 'Fhqwhgads'
    click_button 'Create'
    expect(page).to have_content 'Sorry'
    fill_in 'Email', with: 'mat@schaffer.me'
    click_button 'Let me know!'
    expect(page).to have_content 'Thanks'
  end
end
