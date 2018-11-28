##
# = DashboardController
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# This controller provides methods for the dashboard.
class DashboardController < ApplicationController
  before_action :protect_admin_resources, only: :index

  ##
  # GET /dashboard
  def index
    @page_title = 'Dashboard'
  end
end
