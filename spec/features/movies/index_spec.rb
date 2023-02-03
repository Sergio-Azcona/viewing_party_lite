require 'rails_helper'

RSpec.describe 'Movies - Top Rated and Searched' do
  let(:user) {create (:user) }
  
  it 'has a Discover Page button which returns to the respective page'do
    json_response = File.read('spec/fixtures/top_rated_movies.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?")
      .with(query: {"api_key" => ENV['api_key'], "language" => 'en-US', "page" => '1'})
      .to_return(status: 200, body: json_response) 
    
    visit (user_movies_path(user.id))

    expect(page).to have_button('Discover Movies')
    click_button('Discover Movies')
    
    expect(current_path).to eq(discover_user_path(user.id))
  end

  describe 'Top Rated view' do
    before(:each)do
      json_response = File.read('spec/fixtures/top_rated_movies.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?")
        .with(query: {"api_key" => ENV['api_key'], "language" => 'en-US', "page" => '1'})
        .to_return(status: 200, body: json_response) 

      visit (user_movies_path(user.id))
    end 

    it 'returns the top rated movies based on rating (descending)' do
      #how can i use within/test individual movie ratings? 
      # within("#movie-#{movie.id}") do
      # expect(page).to have_content('Vote Average: 8.7')
      #end
      
      expect('The Godfather').to appear_before('The Shawshank Redemption')
      expect('The Shawshank Redemption').to appear_before('The Godfather Part II')
      
      expect('Vote Average: 8.7').to appear_before('Vote Average: 8.6')
      expect('Vote Average: 8.6').to appear_before('Vote Average: 8.5')
    end
  end

end