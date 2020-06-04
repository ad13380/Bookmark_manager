require 'pg'

class Bookmark
  def self.all
    conn = select_database
    result = conn.exec( "SELECT * FROM bookmarks" )
    result.map { |bookmark| bookmark["url"] }
  end

  def self.create(new_url)
    conn = select_database
    conn.exec_params( 'INSERT INTO bookmarks (url) VALUES ($1)', [new_url] )
  end

  def self.select_database
    if ENV['RACK_ENV'] == 'test'
      PG.connect( dbname: 'bookmark_manager_test' )   
    else
      PG.connect( dbname: 'bookmark_manager' )  
    end
  end
end

