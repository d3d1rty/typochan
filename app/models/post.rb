##
# = Post
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# This model provides validations and methods for posts.
class Post < ApplicationRecord
  belongs_to :board
  has_many :replies, dependent: :destroy
  validates :subject, presence: true, length: { maximum: 75 }
  validates :body, presence: true, length: { maximum: 10000 }
end
