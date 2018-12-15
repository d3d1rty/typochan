require 'test_helper'

##
# = BoardsControllerTest
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# This is the test case for the Boards controller.
class BoardsControllerTest < ActionDispatch::IntegrationTest
  ##
  # Sets up the test case.
  setup do
    @user = User.create!(email: 'example@example.com', password: 'letmein', handle: 'test', admin: true)
    @board = boards(:one)
  end

  ##
  # Provides test for the index action.
  test "should get index" do
    get boards_path(as: @user)
    assert_response :success
  end

  ##
  # Provides test for the new action.
  test "should get new" do
    get new_board_path(as: @user)
    assert_response :success
  end

  ##
  # Provides test for the create action.
  test "should create board" do
    assert_difference('Board.count') do
      post boards_path(as: @user), params: { board: { description: 'This is a description', name: 'TestBoard', short_name: 'test', priority: '3' } }
    end

    assert_redirected_to board_path(Board.last)
  end

  ##
  # Provides test for the show action.
  test "should show board" do
    get board_path(@board)
    assert_response :success
  end

  ##
  # Provides test for the edit action.
  test "should get edit" do
    get edit_board_path(@board, as: @user)
    assert_response :success
  end

  ##
  # Provides test for the update action.
  test "should update board" do
    patch board_path(Board.last, as: @user), params: { board: { description: 'This is a description', name: 'TestBoard', short_name: 'testy', priority: '3' } }
    assert_redirected_to board_path(Board.friendly.find(@board.id))
  end

  ##
  # Provides test for the destroy action.
  test "should destroy board" do
    assert_difference('Board.count', -1) do
      delete board_path(@board, as: @user)
    end

    assert_redirected_to boards_path
  end
end
