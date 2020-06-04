require 'pg'

class Bookmark
  def self.all
    conn = select_database
    result = conn.exec( "SELECT * FROM bookmarks" )
    array_to_return = []
    result.each do |bookmark| 
      array_to_return << {
        id: bookmark['id'],
        title: bookmark['title'],
        url: bookmark["url"] 
      }
    end
    array_to_return
  end

  def self.create(new_url, new_title)
    conn = select_database
    conn.exec("INSERT INTO bookmarks (url,title) VALUES ('#{new_url}','#{new_title}')")
  end

  def self.select_database
    if ENV['RACK_ENV'] == 'test'
      PG.connect( dbname: 'bookmark_manager_test' )   
    else
      PG.connect( dbname: 'bookmark_manager' )  
    end
  end
end

