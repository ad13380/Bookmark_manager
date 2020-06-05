require 'sinatra'

feature "/bookmarks page" do
  scenario "views bookmarks" do
    Bookmark.create('http://www.google.com','Google')
    Bookmark.create('http://www.makersacademy.com','Makers Academy')
    Bookmark.create('http://www.destroyallsoftware.com','Destroy All Software')

    visit '/bookmarks'

    expect(page).to have_link('Google', href: 'http://www.google.com')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destroy All Software',  href: 'http://www.destroyallsoftware.com')
  end
end
