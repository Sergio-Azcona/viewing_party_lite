class MoviesController < ApplicationController
  def search
    conn = Faraday.new(url: "https://api.themoviedb.org") do |f|
      f.params["api_key"] = ENV['api_key']
      f.params["language"] = ENV['en-US']
    end
  
  require 'pry';binding.pry
  top_rated_response = conn.get('/3/movie/top_rated?page=1')
  data = JSON.parse(top_rated_response.body, symbolize_names: true)
  end

end