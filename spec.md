# Specifications for the Rails Assessment

Specs:

- [x] Using Ruby on Rails for the project (created using Ruby '2.6.3')
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) (Beer has_many Reviews)
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) (Beer belongs_to User)
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) (Beer has_many Users through Reviews &  User has_many Beers through Reviews)
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) (Beer has_many Users through Reviews &  User has_many Beers through Reviews)
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) => The Review Model has title:, rating:, and description: attributes that can be set by a User when creating a Review.
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)(User, Review, Beer, Category have validations)
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) (Review has order_by_rating scope method)
- [x] Include signup => get'/signup'
- [x] Include login => get '/login'
- [x] Include logout => delete '/logout'
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) => google, facebook, and github omniauth.
- [x] Include nested resource show or index (URL e.g. users/2/recipes) => beers/1/reviews, categories/1/beers
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) => beers/1/reviews/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new) => Uses partials to display errors <%= render partial: 'layouts/errors', locals: {object: @review}  %>

Confirm:

- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
