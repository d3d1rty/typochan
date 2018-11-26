class Reply < ApplicationRecord
  belongs_to :post
  has_closure_tree
  validates :body, presence: true, length: { maximum: 10000 }
end
