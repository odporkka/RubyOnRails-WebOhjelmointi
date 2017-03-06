class Rating < ActiveRecord::Base
  belongs_to :beer, touch: true
  belongs_to :user

  scope :recent, -> { order(created_at: :desc).first(5)}

  validates :score, numericality: { greater_than_or_equal_to: 1,
                                    less_than_or_equal_to: 10,
                                    only_integer: true }

  def to_s
    beer.name + " (" + self.score.to_s + ")"
  end
end
