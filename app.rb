require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    "Welcome to Bookmark Manager!"
  end

  get '/add-bookmark' do
    erb(:add_bookmark)
  end

  post '/save-bookmark' do
    Bookmark.create(params[:url], params[:title])
    redirect '/bookmarks'
  end

  post '/delete-bookmark' do
    Bookmark.delete(params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:view_bookmarks)
  end

  run! if app_file == $0
end
