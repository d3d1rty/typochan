require "application_system_test_case"

##
# = PostsTest
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# This is the system test case for the Posts functionality.
class PostsTest < ApplicationSystemTestCase
  ##
  # Sets up the test case.
  setup do
    @post = posts(:one)
  end

  ##
  # Provides test case for creating a post.
  test "creating a Post" do
    visit posts_url
    click_on "New Post"

    fill_in "Board", with: @post.board_id
    fill_in "Body", with: @post.body
    fill_in "Poster", with: @post.poster
    fill_in "Subject", with: @post.subject
    click_on "Create Post"

    assert_text "Post was successfully created"
    click_on "Back"
  end

  ##
  # Provides test case for destroying a post.
  test "destroying a Post" do
    visit posts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Post was successfully destroyed"
  end
end
