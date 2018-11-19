##
# = User
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# This model provides validations and methods for users.
class User < ApplicationRecord
  include Clearance::User
  validates :email, length: { maximum: 75 }
  validates :handle, presence: true, length: { maximum: 20 }
end
