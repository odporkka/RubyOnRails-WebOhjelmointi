class Brewery < ActiveRecord::Base
  include RatingAverage

  validates :name, length: {minimum: 1}
  validates :year, numericality: {greater_than_or_equal_to: 1042,
                                  less_than_or_equal_to: ->(_brewery) { Date.current.year }}

  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

end
