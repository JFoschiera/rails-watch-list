# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "json"
require "rest-client"
require "open-uri"


List.create(name: "Drama")
List.create(name: "Comedy")
List.create(name: "Suspense")
List.create(name: "Horror")

Bookmark.create(comment: 'Lovely movie!', movie_id: 1, list_id: 1)
Bookmark.create(comment: 'My cup of tea', movie_id: 2, list_id: 1)
Bookmark.create(comment: 'Could be better', movie_id: 3, list_id: 2)



url = "http://tmdb.lewagon.com/movie/top_rated"
post_serialized = URI.open(url).read
get_all = JSON.parse(post_serialized)
big_arr = get_all.values[1]

big_arr.each do |el|
  complement_text = 'https://image.tmdb.org/t/p/original'

  Movie.create(title: el["title"], overview: el["overview"], poster_url: "#{complement_text}#{el['poster_path']}", rating: el["vote_average"])
end
