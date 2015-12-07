# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')
require 'faker'

TITLES = ["Roasted Brussels Sprouts",
  "Fresh Brussels Sprouts Soup",
  "Brussels Sprouts with Toasted Breadcrumbs, Parmesan, and Lemon",
  "Cheesy Maple Roasted Brussels Sprouts and Broccoli with Dried Cherries",
  "Brussels Sprouts and Egg Salad with Hazelnuts"]

MEASUREMENTS = ["cup(s)", "pound(s)", "tablespoon(s)", "teaspoon(s)", "kilogram(s)", "gram(s)", "quart(s)", "gallon(s)", "barrel(s)"]

FAKESTUFF = [Faker::Avatar.image, Faker::University.name, Faker::Internet.email, Faker::Hacker.say_something_smart, Faker::Lorem.sentence, Faker::Company.catch_phrase, Faker::Company.bs, Faker::Commerce.product_name, Faker::Commerce.department(3)]

def make_ingredients
  place = [Faker::Address.city, Faker::Address.state, Faker::Address.country]
  ingredients = ["#{place.sample} brussels sprouts"]
  (rand(4)+3).times do
    ingredients << "#{rand(49)+1} #{MEASUREMENTS.sample} #{Faker::SlackEmoji.food_and_drink[1..-2]}"
  end
  ingredients.join("\n")
end

def make_steps
  steps = []
  (1..rand(5)+3).each do |n|
    steps << "#{n}. #{FAKESTUFF.sample}"
  end
  steps.join("\n")
end

def make_comment
  comment = []
  (rand(2)+1).times do
    comment << "#{FAKESTUFF.sample}"
  end
  comment.join(" ")
end

count = 1
TITLES.each do |title|
  Recipe.create({title: title, ingredients: make_ingredients, steps: make_steps})
  (rand(5)+1).times do
    Comment.create({body: make_comment, recipe_id: count})
  end
  count += 1
end
