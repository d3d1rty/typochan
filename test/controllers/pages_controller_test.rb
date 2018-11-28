require 'test_helper'

##
# = PagesControllerTest
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# This is the test case for the Pages controller.
class PagesControllerTest < ActionDispatch::IntegrationTest
  ##
  # Provides test for the show action.
  test "should get show" do
    get pages_show_url
    assert_response :success
  end

  ##
  # Provides test for the new action.
  test "should get new" do
    get pages_new_url
    assert_response :success
  end

  ##
  # Provides test for the edit action.
  test "should get edit" do
    get pages_edit_url
    assert_response :success
  end

  ##
  # Provides test for the create action.
  test "should get create" do
    get pages_create_url
    assert_response :success
  end

  ##
  # Provides test for the update action.
  test "should get update" do
    get pages_update_url
    assert_response :success
  end

  ##
  # Provides test for the destroy action.
  test "should get destroy" do
    get pages_destroy_url
    assert_response :success
  end
end
