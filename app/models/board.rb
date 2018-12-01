##
# = Board
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# This model provides validations and methods for boards.
class Board < ApplicationRecord
  extend FriendlyId
  friendly_id :short_name, use: :slugged
  has_many :posts, dependent: :destroy
  validates :name, presence: true, length: { maximum: 75 }, format: { with: /(\A[\w]+\b){1}\z/, message: 'must be a single word.' }
  validates :short_name, presence: true, length: { maximum: 5 }, format: { with: /(\A[\w]+\b){1}\z/, message: 'must be a single word.' }
  validates :description, length: { maximum: 75 }
  validates :priority, presence: true, uniqueness: true
end
