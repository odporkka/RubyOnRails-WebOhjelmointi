require 'rails_helper'

RSpec.describe User, type: :model do
  it "has the username set correctly" do
    user = User.new username: "Pekka"

    expect(user.username).to eq("Pekka")
  end

  it "is not saved without a password" do
    user = User.create username: "Pekka"

    expect(user).not_to be_valid
    expect(User.count).to eq(0)
  end

  describe "with a proper password" do
    let(:user) { FactoryGirl.create(:user) }

    it "is saved" do
      expect(user).to be_valid
      expect(User.count).to eq(1)
    end

    it "and with two ratings, has the correct average rating" do
      user.ratings << FactoryGirl.create(:rating)
      user.ratings << FactoryGirl.create(:rating2)

      expect(user.ratings.count).to eq(2)
      expect(user.average_rating).to eq(7.0)
    end
  end

  it "is not saved with too short password" do
    user = User.create username: "Pekka", password: "short", password_confirmation: "short"
    expect(user).to_not be_valid
    expect(User.count).to eq(0)
  end

  it "is not saved with password containing only alphabets" do
    user = User.create username: "Pekka", password: "Onlyalphabets", password_confirmation: "Onlyalphabets"
    expect(user).to_not be_valid
    expect(User.count).to eq(0)
  end

  describe "favorite style" do
    let(:user){ FactoryGirl.create(:user) }

    it "has method for determining one" do
      expect(user).to respond_to(:favorite_style)
    end

    it "without ratings does not have one" do
      expect(user.favorite_style).to eq(nil)
    end

    it "is the style of only rated if only one rating" do
      create_beer_with_rating(FactoryGirl.create(:brewery) , FactoryGirl.create(:style, name: "lager"), user, 4)

      expect(user.favorite_style.name).to eq("lager")
    end

    it "is the style with best average if many ratings" do
      create_beers_with_ratings(FactoryGirl.create(:brewery), FactoryGirl.create(:style, name: "helles"), user, 10, 7, 9)
      create_beers_with_ratings(FactoryGirl.create(:brewery), FactoryGirl.create(:style, name: "ipa"), user, 10, 9)
      create_beers_with_ratings(FactoryGirl.create(:brewery), FactoryGirl.create(:style, name: "dunkel"), user, 9, 10, 5, 8)

      expect(user.favorite_style.name).to eq("ipa")
    end
  end
end

def create_beer_with_rating(brewery, style, user, score)
  beer = FactoryGirl.create(:beer, brewery: brewery, style: style)
  FactoryGirl.create(:rating, score:score, beer:beer, user:user)
  beer
end

def create_beers_with_ratings(brewery, style, user, *scores)
  scores.each do |score|
    create_beer_with_rating(brewery, style, user, score)
  end
end

