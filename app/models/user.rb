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

  def favorite_beer
    return nil if ratings.empty?
    ratings.sort_by{ |r| r.score }.last.beer
  end

  def favorite_brewery
    return nil if ratings.empty?

    ratings_of_breweries = ratings.group_by { |r| r.beer.brewery }
    averages_of_breweries = []
    ratings_of_breweries.each do |brewery, ratings|
      averages_of_breweries << {
          brewery: brewery,
          rating: ratings.map(&:score).sum / ratings.count.to_f
      }
    end
    averages_of_breweries.sort_by{ |b| -b[:rating] }.first[:brewery]
  end

  def favorite_style
    return nil if ratings.empty?

    ratings_of_styles = ratings.group_by { |r| r.beer.style }
    averages_of_styles = []
    ratings_of_styles.each do |style, ratings|
      averages_of_styles << {
          style: style,
          rating: ratings.map(&:score).sum / ratings.count.to_f
      }
    end
    averages_of_styles.sort_by{ |b| -b[:rating] }.first[:style]
  end
end
