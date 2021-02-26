require 'pg'
require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/bookmarks/new' do
    url = params[:url]
    
    # connection = PG.connect(dbname: 'bookmark_manager_test')
    # connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    p ENV

    @list = Bookmark.all
    erb :bookmarks
  end

  run! if app_file == $0
end
