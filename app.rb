require 'pg'
require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/bookmarks/new' do
    # url = params[:url]
    Bookmark.create(url: params[:url])
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    p ENV

    @list = Bookmark.all
    erb :bookmarks
  end

  run! if app_file == $0
end
