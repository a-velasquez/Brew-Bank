# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

beer = Beer.create(
  name: "Bud Light",
  brewer: "Budweiser",
  alcohol: 5.0,
  description: "Bud light is an American light lager beer.",
  category_id: 2
)

review = Review.create(
  title: "Bud Light Review",
  rating: 3,
  content: "This beer is cheap and readily available, yet lacks flavor.",
  user_id: 1,
  beer_id: 1
)