require 'bookmark'
require 'bookmark_helper'

describe Bookmark do

  describe ".all" do
    add_test_data
    list = Bookmark.all
    it "reture a list of bookmarks" do
      expect(list).to include("http://www.google.com")
      expect(list).to include("http://www.makersacademy.com")
      expect(list).to include("http://www.destroyallsoftware.com")
    end
  end

  describe ".create" do
    it "creates a new bookmark" do
      Bookmark.create('test.url')
      expect(Bookmark.all).to include('test.url')
    end
  end

end