##
# = PostsController
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# This controller provides methods for accessing post resources.
class PostsController < ApplicationController
  before_action :set_post, only: %i[show destroy]
  before_action :set_board, only: %i[create show destroy]
  before_action :protect_admin_resources, only: :destroy
  invisible_captcha only: :create

  ##
  # GET /boards/:board_id/posts/:post_id
  def show
    @page_title = @post.subject
    @reply = @post.replies.new
    @replies = @post.replies.all
  end

  ##
  # POST /boards/:board_id/posts
  def create
    @post = @board.posts.new(post_params)
    @post.poster = signed_in? ? current_user.handle : 'Anon'

    if @post.save
      redirect_to board_post_path(@board, @post), notice: 'Post was successfully created.'
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to board_path(@board)
    end
  end

  ##
  # DELETE /boards/:board_id/posts/:post_id
  def destroy
    @post.destroy
    redirect_to board_path(@board), notice: 'Post was successfully destroyed.'
  end

  private

  ##
  # Sets post for an action.
  def set_post
    @post = Post.find(params[:id])
  end

  ##
  # Sets board for an action.
  def set_board
    @board = Board.find(params[:board_id])
  end

  ##
  # Processes parameters for board requests.
  def post_params
    params.require(:post).permit(:poster, :subject, :body, :board_id, :reply_id)
  end
end
