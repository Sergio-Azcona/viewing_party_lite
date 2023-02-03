require 'rails_helper'

RSpec.describe 'User movies details page' do
    let(:user) {create (:user) }
    describe "When I visit a movie's detail page (/users/:user_id/movies/:movie_id where :id is a valid user id" do
        it 'should have a button to create a viewing party' do
            # visit user_movie_path(user.id, )

            # expect(page).to have_button('Create Viewing Party')
        end

        it 'should have a button to return to the discover page' do
            
        end
    end
end