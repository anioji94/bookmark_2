# require 'pg'

feature 'viewing bookmarks' do
  scenario 'user wants to see all of their bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Makers');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.google.com', 'Google');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.youtube.com', 'YouTube');")
    
    visit '/bookmarks'
    expect(page).to have_content "Makers: http://www.makersacademy.com"
    expect(page).to have_content "Google: http://www.google.com"
    expect(page).to have_content "YouTube: http://www.youtube.com"
  end
end
