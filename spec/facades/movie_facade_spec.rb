require 'rails_helper'

RSpec.describe MovieFacade do
  before(:each)do
    json_response = File.read('spec/fixtures/top_rated_movies.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?")
      .with(query: {"api_key" => ENV['api_key'], "language" => 'en-US', "page" => '1'})
      .to_return(status: 200, body: json_response) 
  end 

  it 'returns 20 movies object in an array' do
    movie = MovieFacade.top_rated
    expect(movie.count).to eq(20)
    expect(movie).to be_a(Array) 
  end

  it 'returns title, vote_average, and id values' do
    movie = MovieFacade.top_rated
    expect(movie.first.title).to eq('The Godfather')
    expect(movie.first.vote_average).to eq(8.7)
    expect(movie.first.id).to eq(238)
  end

end