class Review < ApplicationRecord
  RATINGS = [
    [1, "❤️"],
    [2, "❤️❤️"],
    [3, "❤️❤️❤️"],
    [4, "❤️❤️❤️❤️"],
    [5, "❤️❤️❤️❤️❤️"]
  ]

  validates :rating, presence: true, numericality: true, inclusion: { in: 1..5 }
  belongs_to :user
  belongs_to :eyeshadow, optional: true
  belongs_to :lipstick, optional: true
  belongs_to :mascara, optional: true 

end
