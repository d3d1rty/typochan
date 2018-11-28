##
# = Reply
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# This model provides validations and methods for replies.
class Reply < ApplicationRecord
  belongs_to :post
  has_closure_tree dependent: :destroy
  validates :body, presence: true, length: { maximum: 10000 }
end
