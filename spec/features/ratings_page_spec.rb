require 'rails_helper'

include Helpers

describe "Rating" do
  let!(:brewery) { FactoryGirl.create :brewery, name:"Koff" }
  let!(:style) { FactoryGirl.create :style }
  let!(:beer1) { FactoryGirl.create :beer, name:"iso 3", brewery:brewery, style: style }
  let!(:beer2) { FactoryGirl.create :beer, name:"Karhu", brewery:brewery, style: style }
  let!(:user) { FactoryGirl.create :user }

  before :each do
    sign_in(username:"Pekka", password:"Foobar1")
  end

  it "when given, is registered to the beer and user who is signed in" do
    visit new_rating_path
    select('iso 3', from:'rating[beer_id]')
    fill_in('rating[score]', with:'9')

    expect{
      click_button "Create Rating"
    }.to change{Rating.count}.from(0).to(1)

    expect(user.ratings.count).to eq(1)
    expect(beer1.ratings.count).to eq(1)
    expect(beer1.average_rating).to eq(9.0)
  end

  describe "when there is ratings" do
    let!(:rating1) { FactoryGirl.create :rating, user: FactoryGirl.create(:user, username:'Pultsari1')}
    let!(:rating2) { FactoryGirl.create :rating2, user: FactoryGirl.create(:user, username:'Pultsari2')}
    it "number of ratings is shown on ratings page" do
      visit ratings_path
      expect(page).to have_content('Number of ratings: 2')
    end

    it "added ratings are shown on ratings page" do
      visit ratings_path
      expect(page).to have_content('anonymous, 5')
      expect(page).to have_content('anonymous, 9')
    end
  end
end