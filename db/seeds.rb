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
b4 = Brewery.create name:"Guinness Ltd.", year:1759
b5 = Brewery.create name:"Murphy Brewery Ireland Limited", year:1800
b6 = Brewery.create name:"Olvi Oyj", year:1878
b7 = Brewery.create name:"Brouwerij van Hoegaarden", year: 1445

u1 = User.create username:"Ode", password:"Qwe123", password_confirmation:"Qwe123"
u2 = User.create username:"Masa", password:"Qwe123", password_confirmation:"Qwe123"

bc1 = BeerClub.create name:"Porin panijat", founded:1995
bc2 = BeerClub.create name:"Stadin tissuttelijat", founded:1965

Membership.create beer_club_id: 1, user_id: 1
Membership.create beer_club_id: 1, user_id: 2
Membership.create beer_club_id: 2, user_id: 1

Style.create name:"Euro Pale Lager", description:"Similar to the Munich Helles story, many European countries reacted to the popularity of early pale lagers by brewing their own. Hop flavor is significant and of noble varieties, bitterness is moderate, and both are backed by a solid malt body and sweetish notes from an all-malt base."
Style.create name:"English Pale Ale", description:"The English Pale Ale can be traced back to the city of Burton-upon-Trent, a city with an abundance of rich hard water. This hard water helps with the clarity as well as enhancing the hop bitterness. This ale can be from golden to reddish amber in color with generally a good head retention. A mix of fruity, hoppy, earthy, buttery and malty aromas and flavors can be found. Typically all ingredients are English."
Style.create name:"Baltic Porter", description:"Porters of the late 1700's were quite strong compared to todays standards, easily surpassing 7% alcohol by volume. Some brewers made a stronger, more robust version, to be shipped across the North Sea, dubbed a Baltic Porter. In general, the styles dark brown color covered up cloudiness and the smoky/roasted brown malts and bitter tastes masked brewing imperfections. The addition of stale ale also lent a pleasant acidic flavor to the style, which made it quite popular. These issues were quite important given that most breweries were getting away from pub brewing and opening up breweries that could ship beer across the world."
Style.create name:"Weizen", description:"A south German style of wheat beer (weissbier) made with a typical ratio of 50:50, or even higher, wheat. A yeast that produces a unique phenolic flavors of banana and cloves with an often dry and tart edge, some spiciness, bubblegum or notes of apples. Little hop bitterness, and a moderate level of alcohol. The \"Hefe\" prefix means \"with yeast\", hence the beers unfiltered and cloudy appearance. Poured into a traditional Weizen glass, the Hefeweizen can be one sexy looking beer.  
Often served with a lemon wedge (popularized by Americans), to either cut the wheat or yeast edge, which many either find to be a flavorful snap ... or an insult and something that damages the beer\'s taste and head retention."
Style.create name:"Irish Dy Stout", description:"One of the most common stouts, Dry Irish Stout tend to have light-ish bodies to keep them on the highly drinkable side. They're usually a lower carbonation brew and served on a nitro system for that creamy, masking effect. Bitterness comes from both roasted barley and a generous dose of hops, though the roasted character will be more noticeable. Examples of the style are, of course, the big three, Murphy's, Beamish, and Guinness, however there are many American brewed Dry Stouts that are comparable, if not better."
Style.create name:"Irish Red Ale", description:"A bit sweet, with a lightly hopped tea-like flavor, and an even dextrinous body, Irish Red Ales are easy to please. Look for well-rounded and blanced flavors, and a pleasant toasted malt character in many examples. A drying finish is common."
Style.create name:"Euro Strong Lager", description:"Many breweries around the world brew a stronger version of their regular lager. For the US there is the Ice Beer & Malt Liquor, both have a high amount of rice or corn to lighten the flavor. Many European & Asian breweries have a strong lager similar to the Malt Liquor though there is more malt use or it is all malt. Many breweries rush the fermentation or the brew will be too light and signs of higher alcohols will be noticed in the aroma and flavor."
Style.create name:"Witbier", description:"A Belgian Style ale that's very pale and cloudy in appearance due to it being unfiltered and the high level of wheat, and sometimes oats, that's used in the mash. Always spiced, generally with coriander, orange peel and other oddball spices or herbs in the back ground. The crispness and slight twang comes from the wheat and the lively level of carbonation. This is one style that many brewers in the US have taken a liking to and have done a very good job of staying to style. Sometimes served with a lemon, but if you truly want to enjoy the untainted subtleties of this style you'll ask for yours without one. Often referred to as \"white beers\" (witbieren) due to the cloudiness / yeast in suspension."

b1.beers.create name:"Koff III", style_id: 1
b1.beers.create name:"Karhu III", style_id: 1
b1.beers.create name:"Tuplahumala", style_id: 1
b2.beers.create name:"Huvila Pale Ale", style_id: 2
b2.beers.create name:"X Porter", style_id: 3
b3.beers.create name:"Hefeweizen", style_id: 4
b3.beers.create name:"Helles", style_id: 1
b4.beers.create name:"Guinness Draught", style_id: 5
b5.beers.create name:"Murphys Irish Stout", style_id:5
b4.beers.create name:"Smithwick's Premium Red Ale", style_id:6
b6.beers.create name:"Tuplapukki", style_id:7
b7.beers.create name:"Hoegaarden Original White Ale", style_id: 8

u1.ratings.create score: 3, beer_id: 1
u1.ratings.create score: 7, beer_id: 2
u1.ratings.create score: 9, beer_id: 8
u1.ratings.create score: 8, beer_id: 9
u1.ratings.create score: 9, beer_id: 10
u1.ratings.create score: 8, beer_id: 11
u1.ratings.create score: 10, beer_id: 12
