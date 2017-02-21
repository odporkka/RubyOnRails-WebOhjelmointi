class Brewery < ActiveRecord::Base
  include RatingAverage

  validates :name, length: {minimum: 1}
  validates :year, numericality: {greater_than_or_equal_to: 1042,
                                  less_than_or_equal_to: ->(_brewery) { Date.current.year }}

  scope :active, -> { where active:true }
  scope :retired, -> { where active:[nil,false] }

  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

  def self.top(n)
    sorted_by_rating_in_desc_order = Brewery.all.sort_by{ |b| -(b.average_rating||0) }
    sorted_by_rating_in_desc_order[0..n]
  end

end
