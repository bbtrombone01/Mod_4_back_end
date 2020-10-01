require 'rest-client'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

test_user1 = User.create(username: "steven")
test_user2 = User.create(username: "Jen")

def api_call
    response_string = RestClient.get("https://api.scryfall.com/cards/search?format=json&include_extras=false&include_multilingual=false&order=name&page=2&q=%21%27island%27unique%3Aprints&unique=prints")
response_string_Hash = JSON.parse(response_string)
response_string_Hash["data"].each { |card| Card.create(img_url: card["image_uris"]["small"])}
end 

api_call

first_collection = Collection.create(user_id: 1, card_id: 1)
second_collection = Collection.create(user_id:1 ,card_id:2)
third_collection = Collection.create(user_id: 2, card_id: 1)
fourth_collection = Collection.create(user_id: 2, card_id: 2)
