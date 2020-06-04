require 'sinatra'

feature "/bookmarks page" do
  scenario "views bookmarks" do
    Bookmark.create('http://www.google.com','Google')
    Bookmark.create('http://www.makersacademy.com','Makers Academy')
    Bookmark.create('http://www.destroyallsoftware.com','Destory All Software')
    visit '/bookmarks'
    expect(page).to have_content("http://www.google.com")
    expect(page).to have_content("http://www.makersacademy.com")
    expect(page).to have_content("http://www.destroyallsoftware.com")
    expect(page).to have_content("Google")
    expect(page).to have_content("Makers Academy")
    expect(page).to have_content("Destory All Software")
  end
end
