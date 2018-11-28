require 'test_helper'

##
# = RepliesControllerTest
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# This is the test case for the Replies controller.
class RepliesControllerTest < ActionDispatch::IntegrationTest
  ##
  # Provides test case for the create action.
  test "should get create" do
    get replies_create_url
    assert_response :success
  end

  ##
  # Provides test case for the destroy action.
  test "should get destroy" do
    get replies_destroy_url
    assert_response :success
  end

end
