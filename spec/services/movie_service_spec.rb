require 'rails_helper'

RSpec.describe MovieService do
  before(:each)do
    json_response = File.read('spec/fixtures/top_rated_movies.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?")
      .with(query: {"api_key" => ENV['api_key'], "language" => 'en-US', "page" => '1'})
      .to_return(status: 200, body: json_response) 
  end 
    
  it 'returns a parsed JSON body with a results array' do 
    response = MovieService.top_rated_by_vote_average 
    expect(response).to have_key(:results)
    expect(response[:results]).to be_a(Array)
  end
  
  it 'has title, vote_average, and id keys in results ' do
    response = MovieService.top_rated_by_vote_average 
    # require 'pry';binding.pry
    expect(response[:results][0]).to have_key(:title)
    expect(response[:results][0]).to have_key(:vote_average)
    expect(response[:results][0]).to have_key(:id)
  end

  it 'returns the keys in our expected data types' do
    response = MovieService.top_rated_by_vote_average 
    expect(response[:results][0][:title]).to be_a(String)
    expect(response[:results][0][:vote_average]).to be_a(Float)
    expect(response[:results][0][:id]).to be_a(Integer)
  end
end