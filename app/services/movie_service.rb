class MovieService
  def self.top_rated_by_vote_average
    response = conn.get('/3/movie/top_rated?')
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
