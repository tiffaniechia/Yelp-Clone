class Restaurant < ActiveRecord::Base
  has_many :reviews
  validates :name, presence: true

  def average_rating
    reviews.average(:rating)
  end


end

