class Membership < ActiveRecord::Base
  belongs_to :beer_club
  belongs_to :user

  def to_s
    self.beer_club.name + ", joined: " + self.created_at.to_date.to_s
  end
end
