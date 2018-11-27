##
# = Board
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# This model provides validations and methods for boards.
class Board < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :name, length: { maximum: 75 }, format: { with: /(\A[\w]+\b){1}\z/, message: 'must be a single word.' }
  validates :description, length: { maximum: 75 }
end
