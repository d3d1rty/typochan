class Post < ApplicationRecord
  belongs_to :board
  has_many :replies
  validates :subject, presence: true, length: { maximum: 75 }
  validates :body, presence: true, length: { maximum: 10000 }
end
