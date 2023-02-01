require 'rails_helper'

RSpec.describe "welcome index page" do
  before(:each) do
    @u1 = User.create!(name: "User 1", email: "u1@google.com")
    @u2 = User.create!(name: "Friendly 2", email: "u2@y.com")
    @u3 = User.create!(name: "Chill 3", email: "u3@turing.edu")
    @u4 = User.create!(name: "Bull 4", email: "u4@forest.com")

    visit(root_path)
  end

  it 'displays the app name, existing user section, create user button, and link to the home page' do
    save_and_open_page

    expect(page).to have_content("Viewing Party")
    expect(page).to have_content("Existing Users")
    expect(page).to have_link("Home", href: root_path)
    expect(page).to have_button("Create a New User")
  end

  it "displays links to existing users' dashboard within the Existing Users section" do
    within("#existing_users") do
      expect(page).to have_link("User 1", href: user_path(@u1.id))
      expect(page).to have_link("Friendly 2", href: user_path(@u2.id))
      expect(page).to have_link("Chill 3", href: user_path(@u3.id))
      expect(page).to have_link("Bull 4", href: user_path(@u4.id))
    end
  end
end