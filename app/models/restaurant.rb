class Restaurant < ActiveRecord::Base
  has_many :reviews
  validates :name, presence: true

  def average_rating
    return 'No reviews' if reviews.none?
    reviews.average(:rating)
  end


end

