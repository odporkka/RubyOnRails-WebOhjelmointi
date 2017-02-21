class Beer < ActiveRecord::Base
  include RatingAverage

  validates :name, length: {minimum: 1}

	belongs_to :brewery
  belongs_to :style
	has_many :ratings, dependent: :destroy
  has_many :raters, through: :ratings, source: :user

  validates :name, presence: true
  validates :style, presence: true

  def to_s
    self.name + ", " + self.brewery.name
  end

  def self.top(n)
    sorted_by_rating_in_desc_order = Beer.all.sort_by{ |b| -(b.average_rating||0) }
    sorted_by_rating_in_desc_order[0..n]
  end
end
