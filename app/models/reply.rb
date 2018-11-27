class Reply < ApplicationRecord
  belongs_to :post, touch: true
  has_closure_tree dependent: :destroy
  validates :body, presence: true, length: { maximum: 10000 }
end
