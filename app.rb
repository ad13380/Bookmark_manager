require 'sinatra/base'
require_relative './lib/bookmark'
require_relative 'connection_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override

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

  delete '/delete-bookmark/:id' do
    Bookmark.delete(params[:id])
    redirect '/bookmarks'
  end

  get '/edit-bookmark' do
    @bookmark = Bookmark.all.select { |bookmark| bookmark.id ==  params[:id] }
    erb(:edit_bookmark)
  end

  post '/update-bookmark' do
    Bookmark.update(params[:id], params[:title])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/comments/new' do
    @bookmark_id = params[:id]
    erb :'comments/new'
  end

  post '/bookmarks/:id/comments' do
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec("INSERT INTO comments (text, bookmark_id) VALUES('#{params[:comment]}', '#{params[:id]}');")
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:view_bookmarks)
  end

  run! if app_file == $0
end

