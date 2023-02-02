# require 'faraday'
class MovieService
#   response = Faraday.get('https://api.themoviedb.org')

  def search
    conn = Faraday.new(url: "https://api.themoviedb.org") do |f|
      f.params["api_key"] = ENV['api_key']
      f.params["language"] = ENV['en-US']
    end
    
    require 'pry';binding.pry
    top_rated_response = conn.get('/3/movie/top_rated?api_key={{api_key}}&language=en-US&page=1')
    data = JSON.parse(top_rated_response.body, symbolize_names: true)
  end


end
