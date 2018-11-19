##
# = ApplicationController
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# The base controller for the application.
class ApplicationController < ActionController::Base
  include Clearance::Controller
end
