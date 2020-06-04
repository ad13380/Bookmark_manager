require 'sinatra'

feature "/bookmarks page" do
  xscenario "views bookmarks" do
    add_test_data
    visit '/bookmarks'
    expect(page).to have_content("http://www.google.com")
    expect(page).to have_content("http://www.makersacademy.com")
    expect(page).to have_content("http://www.destroyallsoftware.com")
  end
end

