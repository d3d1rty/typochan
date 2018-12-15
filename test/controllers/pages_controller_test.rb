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
  # Sets up the test case.
  setup do
    @user = User.create!(email: 'example@example.com', password: 'letmein', handle: 'test', admin: true)
    @page = pages(:one)
  end

  ##
  # Provides test for the show action.
  test "should get show" do
    get page_path(Page.friendly.find(@page.id))
    assert_response :success
  end

  ##
  # Provides test for the new action.
  test "should get new" do
    get new_page_path(as: @user)
    assert_response :success
  end

  ##
  # Provides test for the edit action.
  test "should get edit" do
    get edit_page_path(@page, as: @user)
    assert_response :success
  end

  ##
  # Provides test for the create action.
  test "should get create" do
    assert_difference('Page.count') do
      post pages_path(as: @user), params: { page: { title: 'Test Page', body: 'This is a test', priority: 3 } }
    end

    assert_redirected_to page_path(Page.last)
  end

  ##
  # Provides test for the update action.
  test "should get update" do
    patch page_path(Page.last, as: @user), params: { page: { title: 'Test Page', body: 'This is another test', priority: 3 } }
    assert_redirected_to page_path(Page.friendly.find(Page.last.id))
  end

  ##
  # Provides test for the destroy action.
  test "should get destroy" do
    assert_difference('Page.count', -1) do
      delete page_path(@page, as: @user)
    end

    assert_redirected_to pages_path
  end
end
