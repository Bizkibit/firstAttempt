class Review < ApplicationRecord
  belongs_to :organization
  belongs_to :user

  validates :body, presence: true
  validates :star, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

end
