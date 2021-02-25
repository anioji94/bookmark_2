require 'bookmark'
#require 'app'

describe Bookmark do
  it 'stores a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.youtube.com');")


    list = Bookmark.all
    
    expect(list).to include "http://www.makersacademy.com"
    expect(list).to include "http://www.google.com"
    expect(list).to include "http://www.youtube.com"
  end
end
