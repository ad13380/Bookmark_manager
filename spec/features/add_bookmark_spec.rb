require 'sinatra'

feature "/add-bookmark" do
  scenario "adds a bookmark" do
    visit "/add-bookmark"
    fill_in 'url', with: 'thisisatest.com'
    fill_in 'title', with: 'bookmark_title'
    click_on 'Submit'
    expect(page).to have_content('thisisatest.com')
    expect(page).to have_content('bookmark_title')
  end
end
