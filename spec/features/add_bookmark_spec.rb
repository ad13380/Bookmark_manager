require 'sinatra'

feature "/add-bookmark" do
  scenario "adds a bookmark" do
    visit "/add-bookmark"
    fill_in 'url', with: 'thisisatest.com'
    fill_in 'title', with: 'This is a Title'
    click_on 'Submit'
    expect(page).to have_link('This is a Title', href: 'thisisatest.com')
  end
end
