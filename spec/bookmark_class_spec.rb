require 'bookmark'
require 'bookmark_helper'

describe Bookmark do

  describe ".all" do
    it "reture a list of bookmarks" do
      Bookmark.create('http://www.google.com','Google')
      Bookmark.create('http://www.makersacademy.com','Makers')

      expect(Bookmark.all.first[:url]).to eq("http://www.google.com")
      expect(Bookmark.all.first[:title]).to eq('Google')
    end
  end

  describe ".create" do
    it "creates a new bookmark" do
      Bookmark.create('test.url','Bookmark Title')
      expect(Bookmark.all.last[:url]).to eq('test.url')
      expect(Bookmark.all.last[:title]).to eq('Bookmark Title')
    end
  end
end

# Bookmark.create(url, title)
#Bookmark.all => 
#{
#  title: "Bookmark Title"
#  url: => "test.url"
#}