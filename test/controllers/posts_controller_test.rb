require 'test_helper'

##
# = PostsControllerTest
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# This is the test case for the Posts controller.
class PostsControllerTest < ActionDispatch::IntegrationTest
  ##
  # Sets up the test case.
  setup do
    @user = User.create!(email: 'example@example.com', password: 'letmein', handle: 'test', admin: true)
    @board = boards(:one)
    @post = posts(:one)
  end

  ##
  # Provides test for the create action.
  test "should create post" do
    assert_difference('Post.count') do
      post board_posts_path(@board), params: { post: { board_id: boards(:one).id, body: 'This is a test.', poster: @user, subject: 'This is a test' } }
    end

    assert_redirected_to board_post_path(@board, Post.last)
  end

  ##
  # Provides test for the show action.
  test "should show post" do
    get board_post_path(@board, @post)
    assert_response :success
  end

  ##
  # Provides test for the destroy action.
  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete board_post_path(@board, @post, as: @user)
    end

    assert_redirected_to board_path(@board)
  end
end
