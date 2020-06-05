require 'sinatra'

feature "/bookmark" do
  scenario "has the option to update an existing bookmark" do
    Bookmark.create('https://www.linkedin.com','Google')

    visit "/bookmarks"
    expect(page).to have_link('Google', href: 'https://www.linkedin.com')
    click_button("update_#{Bookmark.all.last.id}")

    expect(current_path).to eq "/edit-bookmark"
    fill_in('title', with: "LinkedIn")
    click_button('Submit')

    expect(current_path).to eq "/bookmarks"
    expect(page).to have_link('LinkedIn', href: 'https://www.linkedin.com')
  end
end
