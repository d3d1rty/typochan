class User < ApplicationRecord
  include Clearance::User
  validates :email, length: { maximum: 75 }
  validates :handle, presence: true, length: { maximum: 20 }
end
