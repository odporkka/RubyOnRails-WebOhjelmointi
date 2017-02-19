# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
b1 = Brewery.create name:"Koff", year:1897
b2 = Brewery.create name:"Malmgard", year:2001
b3 = Brewery.create name:"Weihenstephaner", year:1042

u1 = User.create username:"Ode", password:"Qwe123", password_confirmation:"Qwe123"
u2 = User.create username:"Masa", password:"Qwe123", password_confirmation:"Qwe123"

u1.ratings.create score: 10, beer_id: 1
u2.ratings.create score: 5, beer_id: 1
u1.ratings.create score: 9, beer_id: 2
u2.ratings.create score: 6, beer_id: 2
u1.ratings.create score: 8, beer_id: 3
u2.ratings.create score: 4, beer_id: 3
u1.ratings.create score: 9, beer_id: 5

bc1 = BeerClub.create name:"Porin panijat", founded:1995
bc2 = BeerClub.create name:"Stadin tissuttelijat", founded:1965

Membership.create beer_club_id: 1, user_id: 1
Membership.create beer_club_id: 1, user_id: 2
Membership.create beer_club_id: 2, user_id: 1

Style.create name:"Lager", description:"Lager"
Style.create name:"Pale Ale", description:"Pale Ale"
Style.create name:"Porter", description:"Porter"
Style.create name:"Weizen", description:"Weizen"

b1.beers.create name:"Iso 3", style_id: 1
b1.beers.create name:"Karhu", style_id: 1
b1.beers.create name:"Tuplahumala", style_id: 1
b2.beers.create name:"Huvila Pale Ale", style_id: 2
b2.beers.create name:"X Porter", style_id: 3
b3.beers.create name:"Hefeweizen", style_id: 4
b3.beers.create name:"Helles", style_id: 1
