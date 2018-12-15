require 'test_helper'
require 'clearance/test_unit'

##
# = DashboardControllerTest
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# This is the test case for the Dashboard controller.
class DashboardControllerTest < ActionDispatch::IntegrationTest
  ##
  # Sets up the test case.
  setup do
    @user = User.create!(email: 'example@example.com', password: 'letmein', handle: 'test', admin: true)
  end

  ##
  # Tests the index action.
  test 'should get dashboard' do
    get dashboard_path(as: @user)
    assert_response :success
  end
end
