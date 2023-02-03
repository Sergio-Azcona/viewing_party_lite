require 'rails_helper'

RSpec.describe 'User Dashboard - Discover Movies page' do
    let(:user) {create (:user) }
    describe 'When I go to a user dashboard and click "Discover Movies" button' do

        it "redirects me to /users/:id/discover', where :id is the user id of the user who's dashboard I was just on" do
            visit user_path(user.id)

            expect(page).to have_button('Discover Movies')
            click_button('Discover Movies')

            expect(current_path).to eq(discover_user_path(user.id))
        end
    end

    it 'has a button to Discover Top Rated Movies, which leads page top rated movies' do
        visit (discover_user_path(user.id))
        save_and_open_page
        expect(page).to have_content('Discover Movies')
        expect(page).to have_button('Find Top Rated Movies')
        
        click_button('Find Top Rated Movies')
        expect(current_path).to eq(user_movies_path(user.id))

    end

end