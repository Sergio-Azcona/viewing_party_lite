require 'rails_helper'

RSpec.describe 'User dashboard' do

    describe 'when I visit /users/:id' do
        let(:user) {create (:user) }

        it "has '<user's name>'s Dashboard' at the top of the page" do
            visit user_path(user.id)

            expect(page).to have_content("#{user.name}'s Dashboard")
        end

        it 'has a button to discover movies' do
            visit user_path(user.id)

            expect(page).to have_button('Discover Movies')
        end

        it 'has a section that lists viewing parties' do
            visit user_path(user.id)

            within('#viewing_parties') do
                expect(page).to have_content('Viewing Parties')
            end
        end
    end
end