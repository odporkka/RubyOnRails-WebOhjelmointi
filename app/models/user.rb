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

  scope :top3active, -> {
    select("users.id, users.username, count(ratings.id) AS ratings_count").
        joins(:ratings).
        group("users.id").
        order("ratings_count DESC").
        first(5)
  }

  def favorite_beer
    return nil if ratings.empty?
    ratings.sort_by { |r| r.score }.last.beer
  end

  def favorite_style
    favorite :style
  end

  def favorite_brewery
    favorite :brewery
  end

  def favorite(category)
    return nil if ratings.empty?

    rated = ratings.map{ |r| r.beer.send(category) }.uniq
    rated.sort_by { |item| -rating_of(category, item) }.first
  end

  def rating_of(category, item)
    ratings_of = ratings.select{ |r| r.beer.send(category)==item }
    ratings_of.map(&:score).inject(&:+) / ratings_of.count.to_f
  end
end
