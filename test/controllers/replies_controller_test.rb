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
  # Sets up the test case.
  setup do
    @user = User.create!(email: 'example@example.com', password: 'letmein', handle: 'test', admin: true)
    @board = boards(:one)
    @post = posts(:one)
  end

  ##
  # Provides test case for the create action.
  test 'should create reply' do
    assert_difference('Reply.count') do
      post board_post_replies_url(@board, @post), params: { reply: { board_id: @board.id, post_id: @post.id, body: 'This is a test body.' } }
    end
    assert_redirected_to board_post_path(@board, @post)
    assert_equal 'Reply was successfully created.', flash[:notice]
  end

  ##
  # Provides test case for the destroy action.
  test "should get destroy" do
    delete board_post_reply_path(@board, @post, replies(:one), as: @user)
    assert_redirected_to board_post_path(@board, @post)
    assert_equal 'Reply was successfully destroyed.', flash[:notice]
  end

end
