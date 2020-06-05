require 'sinatra'

feature "/bookmark" do
  scenario "has the option to delete a bookmark" do
    Bookmark.create('http://www.google.com','Google')
    visit "/bookmarks"
    expect(page).to have_link('Google', href: 'http://www.google.com')
    click_button("delete_#{Bookmark.all.last.id}")
    expect(page).not_to have_link('Google', href: 'http://www.google.com')
  end
end
