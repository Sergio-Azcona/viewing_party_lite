class MovieService
  def self.top_rated_by_vote_average
    response = conn.get('/3/movie/top_rated?')
    parse_json(response) 
  end

  def self.get_movie(id)
    response = conn.get("/3/movie/#{id}?")
    parse_json(response)
  end

  def self.get_movie_cast(id)
    response = conn.get("/3/movie/#{id}/credits?")
    parse_json(response)
  end

  def self.get_movie_review(id)
    response = conn.get("/3/movie/#{id}/reviews?")
    parse_json(response)
  end

  def self.conn
    Faraday.new(url: "https://api.themoviedb.org") do |f|
      f.params["api_key"] = ENV['api_key']
      f.params["language"] = 'en-US'
      f.params["page"] = '1'
    end
  end
    
  def self.parse_json(response) 
    JSON.parse(response.body, symbolize_names: true)
  end
end
