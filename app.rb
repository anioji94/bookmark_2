require 'pg'
require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    p ENV

    @list = Bookmark.all
    erb :bookmarks
  end

  run! if app_file == $0
end
