##
# = BoardsController
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# This controller provides methods for accessing board resources.
class BoardsController < ApplicationController
  before_action :set_board, only: %i[show feed edit update destroy]
  before_action :set_posts, only: %i[show feed]
  before_action :require_login, only: %i[index new edit create update destroy]
  before_action :protect_admin_resources, only: %i[index new edit create update destroy]

  ##
  # GET /boards
  def index
    @page_title = 'Manage Boards'
    @boards = Board.all
  end

  ##
  # GET /boards/:board_id
  def show
    @page_title = @board.name
    @post = Post.new
  end

  ##
  # GET /boards/:board_id/feed.rss
  def feed
    respond_to do |format|
      format.rss { render layout: false }
    end
  end

  ##
  # GET /boards/new
  def new
    @page_title = 'New Board'
    @board = Board.new
  end

  ##
  # GET /boards/:board_id/edit
  def edit
    @page_title = 'Edit Board'
  end

  ##
  # POST /boards
  def create
    @board = Board.new(board_params)
    if @board.save
      flash[:message] = 'Board was successfully created.'
      flash[:type] = 'success'
      redirect_to @board
    else
      flash[:errors] = @board.errors.full_messages
      redirect_to new_board_path
    end
  end

  ##
  # PATCH/PUT /boards/:board_id
  def update
    if @board.update(board_params)
      flash[:message]= 'Board was successfully updated.'
      flash[:type] = 'success'
      redirect_to @board
    else
      flash[:errors] = @board.errors.full_messages
      redirect_to edit_board_path(@board)
    end
  end

  ##
  # DELETE /boards/:board_id
  def destroy
    @board.destroy
    flash[:message] = 'Board was successfully destroyed.'
    flash[:type] = 'success'
    redirect_to boards_url
  end

  private

  ##
  # Sets board for an action.
  def set_board
    @board = Board.find(params[:id])
  end

  ##
  # Sets posts for an action.
  def set_posts
    @posts = @board.posts.all.order(updated_at: :desc)
  end

  ##
  # Processes parameters for board requests.
  def board_params
    params.require(:board).permit(:name, :description)
  end
end
