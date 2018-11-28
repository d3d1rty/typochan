##
# = ApplicationRecord
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# The base application record model.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
