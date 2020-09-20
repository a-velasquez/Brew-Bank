# README

Brew Bank is an app built with Rails that allows users to add beers they have tasted or have yet to taste to the DB. Users can browse the index of beers they or other's have added and leave reviews for beers they have tasted. Users can also browse an index of beer categories (e.g. Lager, IPAs...). Options for logging in or signing up with a username and password are available, but a user can choose to log in or signup through Google, Facebook and Github thanks to Omniauth. Users can browse reviews of other users for a particular beer, but can only edit their own reviews.

## Getting Started

To get started simply fork and clone this repo, cd into the directory and run `bundle install`. Running `rake db:migrate` will Migrate the DB, and running `rails server` and opening your browser to localhost:3000 will let you signup for an account and start saving some beers to your Brew Bank. 🍺

## Structure

Brew Bank uses an MVC structure with 4 Models:

1. User: `username:, email:, password:`
2. Beer: `name:, brewer:, alcohol:, description:`
3. Review: `title:, rating:, content:`
4. Category: `name:`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/a-velasquez/Brew-Bank.git. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TechCrunch project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'Alex_Velasquez'/tech_crunch/blob/master/CODE_OF_CONDUCT.md).