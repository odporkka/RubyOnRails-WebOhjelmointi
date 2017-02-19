class Rating < ActiveRecord::Base
  belongs_to :beer
  belongs_to :user

  validates :score, numericality: { greater_than_or_equal_to: 1,
                                    less_than_or_equal_to: 10,
                                    only_integer: true }

  def to_s
    beer.name + ", " + self.score.to_s
  end
end
