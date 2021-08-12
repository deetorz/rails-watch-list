require 'open-uri'

url = 'http://tmdb.lewagon.com/movie/popular'

movie_data = URI.open(url).read
data = JSON.parse(movie_data)
movies = data['results']

puts 'Cleaning the db...'
Movie.destroy_all

puts 'Creating movies...'
movies.each do |movie|
  Movie.create!(
    title: movie['original_title'],
    overview: movie['overview'],
    rating: movie['vote_average'],
    poster_url: "https://image.tmdb.org/t/p/original#{movie['poster_path']}"
  )
end
puts "Created #{Movie.count} movies."
