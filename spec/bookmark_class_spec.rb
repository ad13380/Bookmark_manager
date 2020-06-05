require 'bookmark'

describe Bookmark do
  describe ".all" do
    it "reture a list of bookmarks" do
      Bookmark.create('http://www.google.com','Google')
      Bookmark.create('http://www.makersacademy.com','Makers')

      expect(Bookmark.all[0].url).to eq("http://www.google.com")
      expect(Bookmark.all[0].title).to eq('Google')
      expect(Bookmark.all[1].url).to eq("http://www.makersacademy.com")
      expect(Bookmark.all[1].title).to eq('Makers')
    end
  end

  describe ".create" do
    it "creates a new bookmark" do
      Bookmark.create('test.url','Bookmark Title')
      expect(Bookmark.all[0].url).to eq 'test.url' 
      expect(Bookmark.all[0].title).to eq 'Bookmark Title' 
    end
  end

  describe ".delete" do
    it "deletes an existing bookmark" do
      Bookmark.create('test_1.url','Bookmark Title 1')
      Bookmark.create('test_2.url','Bookmark Title 2')
      Bookmark.delete(Bookmark.all.last.id)

      expect(Bookmark.all.last.url).not_to eq 'test_2.url' 
      expect(Bookmark.all.last.title).not_to eq 'Bookmark Title 2' 
    end
  end
end
