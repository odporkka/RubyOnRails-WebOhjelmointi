module RatingAverage
  extend ActiveSupport::Concern

  def average_rating
    if ratings.size > 0
      (ratings.inject(0.0) { |sum, n| sum + n.score }/ratings.size).round(2)
    else
      0
    end
  end
end