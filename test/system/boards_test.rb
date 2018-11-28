require "application_system_test_case"

##
# = BoardsTest
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# This is the system test case for the Boards functionality.
class BoardsTest < ApplicationSystemTestCase
  ##
  # Sets up the test case.
  setup do
    @board = boards(:one)
  end

  ##
  # Provides test case for viewing the boards index.
  test "visiting the index" do
    visit boards_url
    assert_selector "h1", text: "Boards"
  end

  ##
  # Provides test case for creating a new board.
  test "creating a Board" do
    visit boards_url
    click_on "New Board"

    fill_in "Description", with: @board.description
    fill_in "Name", with: @board.name
    click_on "Create Board"

    assert_text "Board was successfully created"
    click_on "Back"
  end

  ##
  # Provides test case for updating an existing board.
  test "updating a Board" do
    visit boards_url
    click_on "Edit", match: :first

    fill_in "Description", with: @board.description
    fill_in "Name", with: @board.name
    click_on "Update Board"

    assert_text "Board was successfully updated"
    click_on "Back"
  end

  ##
  # Provides test case for destroying an existing board.
  test "destroying a Board" do
    visit boards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Board was successfully destroyed"
  end
end
