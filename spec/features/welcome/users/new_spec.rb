require 'rails_helper'

RSpec.describe "New User Creation page" do

  xdescribe 'displays a title, form for the user to complete, and submit button' do
    it 'displays a clean form requesting a name and email' do
  
      visit(register_path) 

      expect(page).to have_content('Register a New user')
      expect(page).to field_labeled("Name")
      expect(page).to field_labeled("Email")
      expect(page).to have_button("Create New User")
    end
  end
end