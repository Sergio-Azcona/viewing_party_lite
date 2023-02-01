require 'rails_helper'

RSpec.describe "New User Creation page" do

  describe 'displays a title, form for the user to complete, and submit button' do
    it 'displays a clean form requesting a name and email' do
  
      visit(register_path) 

      expect(page).to have_content('Register a New user')

      expect(page).to have_field
    end
  end
end