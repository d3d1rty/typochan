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
    @post = posts(:one)
  end

  ##
  # Provides test for the create action.
  test "should create post" do
    assert_difference('Post.count') do
      post posts_url, params: { post: { board_id: @post.board_id, body: @post.body, poster: @post.poster, subject: @post.subject } }
    end

    assert_redirected_to post_url(Post.last)
  end

  ##
  # Provides test for the show action.
  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  ##
  # Provides test for the destroy action.
  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
end
