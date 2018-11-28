require 'test_helper'

##
# = DashboardControllerTest
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# This is the test case for the Dashboard controller.
class DashboardControllerTest < ActionDispatch::IntegrationTest
  ##
  # Tests the index action.
  test "should get index" do
    get dashboard_index_url
    assert_response :success
  end
end
