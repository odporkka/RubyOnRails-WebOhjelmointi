class User < ActiveRecord::Base
  include RatingAverage

  has_secure_password

  validates :username, uniqueness: true, length: {minimum: 3,
                                                  maximum: 30}
  validates :password, :format => {:with => /\A(?=.*[A-Z])(?=.*[0-9]).{4,}\z/,
                                   message: "must contain at least 1 upper case letter and 1 number!"}


  has_many :ratings, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :beer_clubs, through: :memberships
  has_many :beers, through: :ratings
end
