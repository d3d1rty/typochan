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
    @board = boards(:one)
  end

  ##
  # Provides test for the index action.
  test "should get index" do
    get boards_url
    assert_response :success
  end

  ##
  # Provides test for the new action.
  test "should get new" do
    get new_board_url
    assert_response :success
  end

  ##
  # Provides test for the create action.
  test "should create board" do
    assert_difference('Board.count') do
      post boards_url, params: { board: { description: @board.description, name: @board.name } }
    end

    assert_redirected_to board_url(Board.last)
  end

  ##
  # Provides test for the show action.
  test "should show board" do
    get board_url(@board)
    assert_response :success
  end

  ##
  # Provides test for the edit action.
  test "should get edit" do
    get edit_board_url(@board)
    assert_response :success
  end

  ##
  # Provides test for the update action.
  test "should update board" do
    patch board_url(@board), params: { board: { description: @board.description, name: @board.name } }
    assert_redirected_to board_url(@board)
  end

  ##
  # Provides test for the destroy action.
  test "should destroy board" do
    assert_difference('Board.count', -1) do
      delete board_url(@board)
    end

    assert_redirected_to boards_url
  end
end
