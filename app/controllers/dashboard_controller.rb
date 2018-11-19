##
# = DashboardController
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# This controller provides methods for the dashboard.
class DashboardController < ApplicationController
  before_action :protect_admin_resources, only: %i[index]

  ##
  # /dashboard
  def index; end

  private

  ##
  # Protects against directory traversal
  def protect_admin_resources
    head status: :unauthorized unless current_user.admin?
  end
end
