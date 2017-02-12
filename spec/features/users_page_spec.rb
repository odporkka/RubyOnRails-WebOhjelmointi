require 'rails_helper'

include Helpers

describe "User" do
  before :each do
    FactoryGirl.create :user
  end

  describe "who has signed up" do
    it "can signin with right credentials" do
      sign_in(username:"Pekka", password:"Foobar1")

      expect(page).to have_content 'Welcome back!'
      expect(page).to have_content 'Pekka'
    end

    it "is redirected back to signin form if wrong credentials given" do
      sign_in(username:"Pekka", password:"wrong")

      expect(current_path).to eq(signin_path)
      expect(page).to have_content 'username and password do not match'
    end

    it "has ratings shown on user page" do
      sign_in(username:"Pekka", password:"Foobar1")
      FactoryGirl.create(:rating, user: User.first)

      visit user_path(User.first.id)
      expect(page).to have_content 'Has made 1 rating'
      expect(page).to have_content 'anonymous, 10'
    end

    it "can remove own rating and its also removed from database" do
      sign_in(username:"Pekka", password:"Foobar1")
      FactoryGirl.create(:rating, user: User.first)

      visit user_path(User.first.id)
      expect {
        find_link(href: '/ratings/1').click
      }.to change{Rating.count}.from(1).to(0)
    end
  end

  it "when signed up with good credentials, is added to the system" do
    visit signup_path
    fill_in('user_username', with:'Brian')
    fill_in('user_password', with:'Secret55')
    fill_in('user_password_confirmation', with:'Secret55')

    expect{
      click_button('Create User')
    }.to change{User.count}.by(1)
  end
end