require 'rails_helper'

RSpec.describe 'User Dashboard - Discover Movies page' do
    describe 'When I go to a user dashbaord and click "Discover Movies" button' do
        let(:user) {create (:user) }

        it "redirects me to /users/:id/discover', where :id is the user id of the user who's dashboard I was just on" do
            visit user_path(user.id)

            expect(page).to have_button('Discover Movies')
            click_button('Discover Movies')

            expect(current_path).to eq(discover_user_path(user.id))
        end
    end
end