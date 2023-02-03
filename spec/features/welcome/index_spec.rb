require 'rails_helper'

RSpec.describe "welcome index page" do
  before(:each) do
    @u1 = create(:user)
    @u2 = create(:user)
    @u3 = create(:user)
    @u4 = create(:user)

    visit(root_path)
  end

  describe 'landing page' do
    describe 'displays the app name, existing user section' do
      it "displays links to existing users' dashboard within the Existing Users section" do
        # save_and_open_page
        expect(page).to have_content("Viewing Party")
        expect(page).to have_content("Existing Users")

        within("#existing_users") do
          expect(page).to have_link(@u1.name, href: user_path(@u1.id))
          expect(page).to have_link(@u2.name, href: user_path(@u2.id))
          expect(page).to have_link(@u3.name, href: user_path(@u3.id))
          expect(page).to have_link(@u4.name, href: user_path(@u4.id))
        end
      end
    end
    
    describe 'links and buttons takes users to the respective pages' do
      it 'has buttons to create a new user, a link to the home page, a link to user show page' do
        expect(page).to have_link("Home", href: root_path)
        click_link("Home")
        expect(current_path).to eq(root_path)

        expect(page).to have_button("Create a New User")
        click_button("Create a New User")
        expect(current_path).to eq(register_path)
      
        click_link("Home")
        click_link(@u4.name)
        expect(current_path).to eq(user_path(@u4.id))
      end
    end
  end
end