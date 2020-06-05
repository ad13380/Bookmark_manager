require 'pg'

class Bookmark
  # class methods

  def self.all
    conn = select_database
    result = conn.exec( "SELECT * FROM bookmarks" )
    result.map { |bookmark| Bookmark.new(bookmark['id'],bookmark['title'],bookmark['url']) }
  end

  def self.create(new_url, new_title)
    conn = select_database
    conn.exec("INSERT INTO bookmarks (url,title) VALUES ('#{new_url}','#{new_title}')")
  end

  def self.delete(new_id)
    conn = select_database
    conn.exec("DELETE FROM bookmarks WHERE id = #{new_id}")
  end

  def self.select_database
    if ENV['RACK_ENV'] == 'test'
      PG.connect( dbname: 'bookmark_manager_test' )   
    else
      PG.connect( dbname: 'bookmark_manager' )  
    end
  end

  # instance methods

  attr_reader :id, :title, :url

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end
end

