# Feature: Translating your name
#   As a visitor
#   I want to get my name in Kanji
#   So I can order products and show off my love of Japanese style
feature 'Name translation' do
  scenario 'Entering my name' do
    visit root_path
    fill_in 'Your Name', with: 'Mathew'
    click_button 'Translate it!'
    expect(page).to have_content '魔臭'
  end
end
