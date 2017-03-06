class BeerClub < ActiveRecord::Base
  has_many :memberships, -> { where confirmed: true}
  has_many :applies, -> { where confirmed: false}, class_name: "Membership"
  has_many :users, through: :memberships

  def to_s
    self.name + ", " + self.city + ", " + self.founded.to_s
  end
end
