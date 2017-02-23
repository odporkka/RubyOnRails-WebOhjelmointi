# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Breweries
b1 = Brewery.create name:"Koff", year:1897, active: true
b2 = Brewery.create name:"Malmgard", year:2001, active: true
b3 = Brewery.create name:"Weihenstephaner", year:1042, active: true
b4 = Brewery.create name:"Guinness Ltd.", year:1759, active: true
b5 = Brewery.create name:"Murphy Brewery Ireland Limited", year:1800, active: true
b6 = Brewery.create name:"Olvi Oyj", year:1878, active: true
b7 = Brewery.create name:"Brouwerij van Hoegaarden", year: 1445, active: true
b8 = Brewery.create name:"Pyynikin käsityöläispanimo Oy", year: 2012, active: true
b9 = Brewery.create name:"Hartwall Oy", year: 1836, active: true
b10 = Brewery.create name:"Porin Oluttehdas", year: 1853, active: false
b11 = Brewery.create name:"Laitilan Wirvoitusjuomatehdas", year:1995, active:true
b12 = Brewery.create name:"Abbaye de Leffe S.A.", year: 1240, active:true
b13 = Brewery.create name:"Nokian Panimo", year: 1991, active:true

#Users
u1 = User.create username:"Ode", password:"Qwe123", password_confirmation:"Qwe123", admin:true, banned:false
u2 = User.create username:"Masa", password:"Qwe123", password_confirmation:"Qwe123", admin:false, banned:false
u3 = User.create username:"Tirppa", password:"Qwe123", password_confirmation:"Qwe123", admin:false, banned:false
u4 = User.create username:"Henkka", password:"Qwe123", password_confirmation:"Qwe123", admin:false, banned:false
u5 = User.create username:"Admin", password:"Admin123", password_confirmation:"Admin123", admin:true, banned:false
u6 = User.create username:"xXx_CaNC3rKID69_xXX05", password:"Qwe123", password_confirmation:"Qwe123", admin:false, banned:true
u7 = User.create username:"Hop-a-holic666", password:"Qwe123", password_confirmation:"Qwe123", admin:false, banned:false

bc1 = BeerClub.create name:"Porin panijat", founded:1995, city:"Pori"
bc2 = BeerClub.create name:"Stadin tissuttelijat", founded:1965, city:"Helsinki"

Membership.create beer_club_id: 1, user_id: 1
Membership.create beer_club_id: 1, user_id: 2
Membership.create beer_club_id: 2, user_id: 1
Membership.create beer_club_id: 2, user_id: 2
Membership.create beer_club_id: 2, user_id: 3
Membership.create beer_club_id: 2, user_id: 4
Membership.create beer_club_id: 2, user_id: 7

s1 = Style.create name:"Euro Pale Lager", description:"Similar to the Munich Helles story, many European countries reacted to the popularity of early pale lagers by brewing their own. Hop flavor is significant and of noble varieties, bitterness is moderate, and both are backed by a solid malt body and sweetish notes from an all-malt base."
s1 = Style.create name:"English Pale Ale", description:"The English Pale Ale can be traced back to the city of Burton-upon-Trent, a city with an abundance of rich hard water. This hard water helps with the clarity as well as enhancing the hop bitterness. This ale can be from golden to reddish amber in color with generally a good head retention. A mix of fruity, hoppy, earthy, buttery and malty aromas and flavors can be found. Typically all ingredients are English."
s3 = Style.create name:"Baltic Porter", description:"Porters of the late 1700's were quite strong compared to todays standards, easily surpassing 7% alcohol by volume. Some brewers made a stronger, more robust version, to be shipped across the North Sea, dubbed a Baltic Porter. In general, the styles dark brown color covered up cloudiness and the smoky/roasted brown malts and bitter tastes masked brewing imperfections. The addition of stale ale also lent a pleasant acidic flavor to the style, which made it quite popular. These issues were quite important given that most breweries were getting away from pub brewing and opening up breweries that could ship beer across the world."
s4 = Style.create name:"Weizen", description:"A south German style of wheat beer (weissbier) made with a typical ratio of 50:50, or even higher, wheat. A yeast that produces a unique phenolic flavors of banana and cloves with an often dry and tart edge, some spiciness, bubblegum or notes of apples. Little hop bitterness, and a moderate level of alcohol. The \"Hefe\" prefix means \"with yeast\", hence the beers unfiltered and cloudy appearance. Poured into a traditional Weizen glass, the Hefeweizen can be one sexy looking beer.  
Often served with a lemon wedge (popularized by Americans), to either cut the wheat or yeast edge, which many either find to be a flavorful snap ... or an insult and something that damages the beer\'s taste and head retention."
s5 = Style.create name:"Irish Dry Stout", description:"One of the most common stouts, Dry Irish Stout tend to have light-ish bodies to keep them on the highly drinkable side. They're usually a lower carbonation brew and served on a nitro system for that creamy, masking effect. Bitterness comes from both roasted barley and a generous dose of hops, though the roasted character will be more noticeable. Examples of the style are, of course, the big three, Murphy's, Beamish, and Guinness, however there are many American brewed Dry Stouts that are comparable, if not better."
s6 = Style.create name:"Irish Red Ale", description:"A bit sweet, with a lightly hopped tea-like flavor, and an even dextrinous body, Irish Red Ales are easy to please. Look for well-rounded and blanced flavors, and a pleasant toasted malt character in many examples. A drying finish is common."
s7 = Style.create name:"Euro Strong Lager", description:"Many breweries around the world brew a stronger version of their regular lager. For the US there is the Ice Beer & Malt Liquor, both have a high amount of rice or corn to lighten the flavor. Many European & Asian breweries have a strong lager similar to the Malt Liquor though there is more malt use or it is all malt. Many breweries rush the fermentation or the brew will be too light and signs of higher alcohols will be noticed in the aroma and flavor."
s8 = Style.create name:"Witbier", description:"A Belgian Style ale that's very pale and cloudy in appearance due to it being unfiltered and the high level of wheat, and sometimes oats, that's used in the mash. Always spiced, generally with coriander, orange peel and other oddball spices or herbs in the back ground. The crispness and slight twang comes from the wheat and the lively level of carbonation. This is one style that many brewers in the US have taken a liking to and have done a very good job of staying to style. Sometimes served with a lemon, but if you truly want to enjoy the untainted subtleties of this style you'll ask for yours without one. Often referred to as \"white beers\" (witbieren) due to the cloudiness / yeast in suspension."
s9 = Style.create name:"American Porter", description:"Inspired from the now wavering English Porter, the American Porter is the ingenuous creation from that. Thankfully with lots of innovation and originality American brewers have taken this style to a new level. Whether it is highly hopping the brew, using smoked malts, or adding coffee or chocolate to complement the burnt flavor associated with this style. Some are even barrel aged in Bourbon or whiskey barrels. The hop bitterness range is quite wide but most are balanced. Many are just easy drinking session porters as well."
s10 = Style.create name:"Munich Helles Lager", description:"When the golden and clean lagers of Plzen (Bohemia) became all the rage in the mid-1800's, München brewers feared that Germans would start drinking the Czech beer vs. their own. Munich Helles Lager was their answer to meet the demand. A bit more malty, they often share the same spicy hop characters of Czech Pils, but are a bit more subdued and in balance with malts. \"Helles\" is German for \"bright.\""
s11 = Style.create name:"American Adjunct Lager", description:"Light bodied, pale, fizzy lagers made popular by the large macro-breweries (large breweries) of America after prohibition. Low bitterness, thin malts, and moderate alcohol. Focus is less on flavor and more on mass-production and consumption, cutting flavor and sometimes costs with adjunct cereal grains, like rice and corn."
s12 = Style.create name:"German Pilsner", description:"The Pilsner beer was first brewed in Bohemia, a German-speaking province in the old Austrian Empire. Pilsner is one of the most popular styles of lager beers in Germany, and in many other countries. Its often spelled as \"Pilsener\", and often times abbreviated, or spoken in slang, as \"Pils.\"

Classic German Pilsners are very light straw to golden in color. Head should be dense and rich. They are also well-hopped, brewed using Noble hops such has Saaz, Hallertauer, Hallertauer Mittelfrüh, Tettnanger, Styrian Goldings, Spalt, Perle, and Hersbrucker. These varieties exhibit a spicy herbal or floral aroma and flavor, often times a bit coarse on the palate, and distribute a flash of citrus-like zest--hop bitterness can be high."
s13 = Style.create name:"Belgian Pale Ale", description:"Belgian Pales consume the Belgian brewing scene, and were initially brewed to compete with Pilseners during the WWII time frame. They differ from other regional Pale Ale varieties, by traditionally being less bitter, using aged hops for a delicate hop finish, and boasting sweetish to toasty malt overtones. They should be decanted properly, leaving the yeast in the bottle. This will showcase their brilliant color range from pale straw yellow to amber hues. Most will be crowned with thick, clinging, rocky white heads. Flavors and aromas will vary. Some have natural spice characters from yeast and hops, while others are spiced."
s14 = Style.create name:"Belgian Dark Ale", description:"Belgian Darks offer a massive range of characters. Colors play within the amber to light brown to deep garnet hues, with thick, rocky heads of great retention. Aromas can be anywhere from traces of yeast, spiced, malty, floral and even slightly intoxicating. Flavors from dry and spiced, to sweet and malty. Most have a low level of bitterness."
b15 = Style.create name:"Märzen", description:"Before refrigeration, it was nearly impossible to brew beer in the summer due to the hot weather and bacterial infections. Brewing ended with the coming of spring, and began again in the fall. Most were brewed in March (Märzen). These brews were kept in cold storage over the spring and summer months, or brewed at a higher gravity, so theyd keep. Märzenbier is full-bodied, rich, toasty, typically dark copper in color with a medium to high alcohol content.

The common Munich Oktoberfest beer served at Wies'n (the location at which Munich celebrates its Oktoberfest) contains roughly 5.0-6.0% alcohol by volume, is dark/copper in color, has a mild hop profile and is typically labeled as a Bavarian Märzenbier in style."
b16 = Style.create name:"Kellerbier / Zwickelbier", description:"A rather old, rare, and unique German beer style, Kellerbiers are unfiltered and unpasteurized lagers that date back to at least the Middle Ages. The beer is matured, unbunged (beer is exposed), in deep vaults. The final product is a smooth, naturally cloudy beer that's rich in vitamins (from the yeast). Hop bitterness can be high and alcohol will vary. Zwickel Bier is similar to a Keller, but not as pronounced."

#Koff
beer1 = b1.beers.create name:"Koff III", style_id: 1
beer2 = b1.beers.create name:"Karhu III", style_id: 1
beer3 = b1.beers.create name:"Tuplahumala", style_id: 1
#Malmgard
beer4 = b2.beers.create name:"Huvila Pale Ale", style_id: 2
beer5 = b2.beers.create name:"X Porter", style_id: 3
#Weihenstephaner
beer6 = b3.beers.create name:"Hefeweizen", style_id: 4
beer7 = b3.beers.create name:"Weihenstephaner Original", style_id: 10
#Guinness
beer8 = b4.beers.create name:"Guinness Draught", style_id: 5
beer9 = b4.beers.create name:"Smithwick's Premium Red Ale", style_id:6
#Murphys
beer10 = b5.beers.create name:"Murphys Irish Stout", style_id:5
#Olvi
beer11 = b6.beers.create name:"Tuplapukki", style_id:7
beer12 = b6.beers.create name:"Sandels", style_id:11
beer13 = b6.beers.create name:"Pirkka III-olut", style_id:1
#Hoegaarden
beer14 = b7.beers.create name:"Hoegaarden Original White Ale", style_id: 8
#Pyynikin
beer15 = b8.beers.create name:"Pikkuportteri", style_id: 9
#Hartwall
beer16 = b9.beers.create name:"Lapin Kulta III", style_id: 1
beer17 = b9.beers.create name:"Karjala III", style_id: 1
#Laitilan
beer18 = b11.beers.create name:"Kukko Lager III", style_id:1
beer19 = b11.beers.create name:"Kukko Pils III", style_id:12
#Leffe
beer20 = b12.beers.create name:"Leffe Blonde", style_id:13
beer21 = b12.beers.create name:"Leffe Brune", style_id:14
#Nokian panimo
beer22 = b13.beers.create name:"Keisari Luomu", style_id:12
beer23 = b13.beers.create name:"Keisari Münchener", style_id:15
beer24 = b13.beers.create name:"Keisari Kellari", style_id:16
beer25 = b13.beers.create name:"Keisari Elowehnä", style_id: 4

#Ode
u1.ratings.create score: 3, beer_id: 1
u1.ratings.create score: 7, beer_id: 2
u1.ratings.create score: 7, beer_id: 7
u1.ratings.create score: 10, beer_id: 8
u1.ratings.create score: 9, beer_id: 9
u1.ratings.create score: 9, beer_id: 10
u1.ratings.create score: 7, beer_id: 11
u1.ratings.create score: 7, beer_id: 12
u1.ratings.create score: 3, beer_id: 13
u1.ratings.create score: 9, beer_id: 14
u1.ratings.create score: 1, beer_id: 16
u1.ratings.create score: 4, beer_id: 17
u1.ratings.create score: 6, beer_id: 18
u1.ratings.create score: 4, beer_id: 19
u1.ratings.create score: 7, beer_id: 20
u1.ratings.create score: 8, beer_id: 21
u1.ratings.create score: 7, beer_id: 22
u1.ratings.create score: 8, beer_id: 23

u2.ratings.create score: 4, beer_id: 1
u2.ratings.create score: 6, beer_id: 2

u3.ratings.create score: 4, beer_id: 1 
u3.ratings.create score: 5, beer_id: 2
u3.ratings.create score: 4, beer_id: 3
u3.ratings.create score: 5, beer_id: 4
u3.ratings.create score: 6, beer_id: 5
u3.ratings.create score: 5, beer_id: 6
u3.ratings.create score: 4, beer_id: 7
u3.ratings.create score: 6, beer_id: 8
u3.ratings.create score: 5, beer_id: 9
u3.ratings.create score: 6, beer_id: 10
u3.ratings.create score: 5, beer_id: 11
u3.ratings.create score: 4, beer_id: 12

u7.ratings.create score: 1, beer_id:1
u7.ratings.create score: 1, beer_id:2
u7.ratings.create score: 2, beer_id:3
u7.ratings.create score: 3, beer_id:4
u7.ratings.create score: 4, beer_id:5
u7.ratings.create score: 3, beer_id:6
u7.ratings.create score: 5, beer_id:7
u7.ratings.create score: 9, beer_id:8
u7.ratings.create score: 6, beer_id:9
u7.ratings.create score: 7, beer_id:10
u7.ratings.create score: 8, beer_id:11
u7.ratings.create score: 9, beer_id:12
u7.ratings.create score: 5, beer_id:13
u7.ratings.create score: 7, beer_id:14
u7.ratings.create score: 2, beer_id:15
u7.ratings.create score: 1, beer_id:16
u7.ratings.create score: 2, beer_id:17
u7.ratings.create score: 3, beer_id:18
u7.ratings.create score: 4, beer_id:19
u7.ratings.create score: 2, beer_id:20
u7.ratings.create score: 5, beer_id:21
u7.ratings.create score: 6, beer_id:22
u7.ratings.create score: 2, beer_id:23
u7.ratings.create score: 1, beer_id:23
