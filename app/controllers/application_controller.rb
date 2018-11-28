##
# = ApplicationController
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# The base controller for the application.
class ApplicationController < ActionController::Base
  include Clearance::Controller

  private

  ##
  # Protects against directory traversal
  def protect_admin_resources
    head 401 unless signed_in? && current_user.admin?
  end
end
