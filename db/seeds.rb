# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'


# json = JSON.parse(open("http://makeup-api.herokuapp.com/api/v1/products.json").read)
json = JSON.parse(open("http://makeup-api.herokuapp.com/api/v1/products.json").read)
json.each do |product|
  if product["product_type"] == "mascara"
    mascara = Mascara.new
    mascara.name = product["name"]
    mascara.brand = product["brand"]
    mascara.image_url = product["image_link"]
    mascara.product_link = product["product_link"]
    mascara.description = product["description"]
    # we could also assign other attributes here
    if mascara.save
      print "#{mascara.name}. "
    end
  elsif product["product_type"] == "eyeshadow"
    eyeshadow = Eyeshadow.new
    eyeshadow.name = product["name"]
    eyeshadow.brand = product["brand"]
    eyeshadow.image_url = product["image_link"]
    eyeshadow.product_link = product["product_link"]
    eyeshadow.description = product["description"]
    if eyeshadow.save
      print "#{eyeshadow.name}. "
    end
  elsif product["product_type"] == "lipstick"
    lipstick = Lipstick.new
    lipstick.name = product["name"]
    lipstick.brand = product["brand"]
    lipstick.image_url = product["image_link"]
    lipstick.product_link = product["product_link"]
    lipstick.description = product["description"]
    if lipstick.save
      print "#{lipstick.name}. "
    end
  end
end
