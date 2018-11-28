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

  # GET /boards
  # GET /boards.json
  def index
    @boards = Board.all
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
    @post = Post.new
  end

  ##
  # Renders RSS feed
  def feed
    respond_to do |format|
      format.rss { render layout: false }
    end
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/1/edit
  def edit
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = Board.new(board_params)
    if @board.save
      flash[:message] = 'Board was successfully created.'
      flash[:type] = 'success'
      redirect_to @board
    else
      render :new
    end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update
    if @board.update(board_params)
      flash[:message]= 'Board was successfully updated.'
      flash[:type] = 'success'
      redirect_to @board
    else
      render :edit
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    @board.destroy
    flash[:message] = 'Board was successfully destroyed.'
    flash[:type] = 'success'
    redirect_to boards_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_board
    @board = Board.find(params[:id])
  end

   # Use callbacks to share common setup or constraints between actions.
  def set_posts
    @posts = @board.posts.all.order(updated_at: :desc)
  end

 ##
  # Protects against directory traversal
  def protect_admin_resources
    head status: :unauthorized unless current_user.admin?
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def board_params
    params.require(:board).permit(:name, :description)
  end
end
