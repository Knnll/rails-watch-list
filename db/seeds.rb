require "json"
require "open-uri"

url = "https://tmdb.lewagon.com/movie/top_rated"
top_movies = URI.open(url).read
movies = JSON.parse(top_movies)['results']
# pp movies

movies.each do |movie|
  Movie.create(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: movie['poster_path'],
    rating: movie['vote_average'].to_i
  )
end
