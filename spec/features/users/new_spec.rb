require 'rails_helper'

RSpec.describe "New User Creation page" do
  before(:each)do 
    visit(register_path) 
  end

  describe 'displays a title, form for the user to complete, and submit button' do
    it 'displays a clean form requesting a name and email' do
      expect(page).to have_content('Register a New user')
      expect(page).to have_field(:name)
      expect(page).to have_field(:email)
      expect(page).to have_button("Create New User")
    end

    it 'sends user to their dashboard page if form is completed correctly and user hits the create button; flashes a success message' do
      fill_in(:name, with: "Chase Ball")
      fill_in(:email, with: "cball@gogo.com")
      
      click_button("Create New User")
      expect(current_path).to eq("/users/1")
      expect(page).to have_content("Update Successful")
    end

    describe 'user is routed back to the create page until form is completed or email is not unique' do
      describe 'values previously filled in fields displays and page has a flash unsuccessful message' do
        it 'routes to user dashboard when form is complete' do
          fill_in(:name, with: "")
          fill_in(:email, with: "cball@gogo.com")
          
          click_button("Create New User")
          expect(current_path).to_not eq("/users/1")
          expect(current_path).to eq(users_path) 
          # save_and_open_page
          expect(page).to have_content("Name can't be blank")
          expect(page).to have_field(:name, with: "")
          expect(page).to have_field(:email, with: "cball@gogo.com")

          fill_in(:name, with: "Chase Ball")
          click_button("Create New User")
          expect(current_path).to_not eq(register_path) 
          expect(current_path).to eq("/users/1")
        end

        it 'routes user to dashboard when email is unique' do
          fill_in(:name, with: "Chase Ball")
          fill_in(:email, with: "cball@gogo.com")
          
          click_button("Create New User")
          expect(current_path).to eq("/users/2")

          visit(register_path) 
          fill_in(:name, with: "Mr. Ball Sr.")
          fill_in(:email, with: "cball@gogo.com")
          click_button("Create New User")

          expect(current_path).to eq(users_path) 
          expect(page).to have_content("Email has already been taken")

          fill_in(:email, with: "cballsr@gogo.com")
          click_button("Create New User")
          
          expect(current_path).to eq("/users/3")
        end

      end
    end
  end
end