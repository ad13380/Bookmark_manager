require 'pg'

class Bookmark
  # class methods
  def self.all
    result = DatabaseConnection.query( "SELECT * FROM bookmarks" )
    result.map { |bookmark| Bookmark.new(bookmark['id'],bookmark['title'],bookmark['url']) }
  end

  def self.create(new_url, new_title)
    result = DatabaseConnection.query("INSERT INTO bookmarks (url,title) VALUES ('#{new_url}','#{new_title}') RETURNING id, title, url;")
    Bookmark.new(result[0]['id'], result[0]['title'], result[0]['url'])
  end

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = #{id}")
  end

  def self.update(id, new_title)
    DatabaseConnection.query("UPDATE bookmarks SET title = '#{new_title}' WHERE id = #{id}")
  end

  def comments
    DatabaseConnection.query("SELECT * FROM comments WHERE bookmark_id = #{id};")
  end

  # instance methods

  attr_reader :id, :title, :url

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end
end

