##
# = DashboardController
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# This controller provides methods for the dashboard.
class DashboardController < ApplicationController
  before_action :protect_mod_resources, only: %i[index review]

  ##
  # GET /dashboard
  def index
    @page_title = 'Dashboard'
  end

  ##
  # GET /dashboard/review
  def review
    @page_title = 'Review Flagged Posts and Replies'
    @posts = Post.where("flagged = ?", true)
    @replies = Reply.where("flagged = ?", true)
  end
end
