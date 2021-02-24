require 'bookmark'
#require 'app'

describe Bookmark do
  it 'stores a list of bookmarks' do
    list = Bookmark.all
    expect(list).to include "http://www.makersacademy.com"
    expect(list).to include "http://www.google.com"
    expect(list).to include "http://www.youtube.com"
  end
end
