require 'bookmark'
#require 'app'

describe Bookmark do
  it 'stores a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Makers');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.google.com', 'Google');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.youtube.com', 'YouTube');")


    list = Bookmark.all
    
    expect(list).to include "Makers: http://www.makersacademy.com"
    expect(list).to include "Google: http://www.google.com"
    expect(list).to include "YouTube: http://www.youtube.com"
  end
end
