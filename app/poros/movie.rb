class Movie
    attr_reader :title, :vote_average, :runtime, :summary, :id
    
    def initialize(movie_data)
        @title = data[:title]
        @vote_average = data[:vote_average]
        @runtime = data[:runtime]
        @summary = data[:overview]
        @id = data[:id]
    end
end