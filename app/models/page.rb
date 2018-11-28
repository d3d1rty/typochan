##
# = Page
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# This model provides validations and methods for pages.
class Page < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates :title, presence: true, uniqueness: true, length: { maximum: 75 }
  validates :body, length: { maximum: 10000 }
  validates :priority, presence: true, uniqueness: true
end
