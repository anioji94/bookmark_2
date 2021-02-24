feature 'viewing bookmarks' do
  scenario 'user wants to see all of their bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.google.com"
    expect(page).to have_content "http://www.youtube.com"
  end
end
