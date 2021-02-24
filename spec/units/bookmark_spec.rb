require 'bookmark'
#require 'app'

describe Bookmark do
  it 'stores a list of bookmarks' do
    list = Bookmark.all
    expect(list).to include "https://www.ruby-lang.org/en/"
    expect(list).to include "https://rspec.info/"
    expect(list).to include "https://github.com/"
  end
end
