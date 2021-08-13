require 'open-uri'

urls = ['http://tmdb.lewagon.com/movie/popular', 'http://tmdb.lewagon.com/movie/top_rated']

puts 'Cleaning the db...'
Bookmark.destroy_all
Movie.destroy_all

urls.each do |url|
  movie_data = URI.open(url).read
  data = JSON.parse(movie_data)
  movies = data['results']


  puts 'Creating movies...'
  movies.each do |movie|
    Movie.create!(
      title: movie['original_title'],
      overview: movie['overview'],
      rating: movie['vote_average'],
      poster_url: "https://image.tmdb.org/t/p/original#{movie['poster_path']}"
    )
  end
end
puts "Created #{Movie.count} movies."
