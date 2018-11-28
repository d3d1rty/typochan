##
# = RepliesController
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# This controller provides methods for accessing reply resources.
class RepliesController < ApplicationController
  before_action :set_reply, only: %i[flag unflag destroy]
  before_action :set_post, only: %i[create flag unflag destroy]
  before_action :set_post_replies, only: :create
  before_action :set_board, only: %i[create flag unflag destroy]
  before_action :protect_mod_resources, only: %i[unflag destroy]
  before_action :protect_user_resources, only: :flag
  invisible_captcha only: :create

  ##
  # POST /boards/:board_id/posts/:post_id/replies
  def create
    @reply = @post_replies.new
    @reply.poster = signed_in? ? current_user.handle : 'Anon'
    @reply.body = reply_params[:body]
    @reply.parent = Reply.find(reply_params[:parent_id]) if reply_to_valid?(reply_params[:parent_id].to_i, get_reply_ids(@post_replies))

    if @reply.save
      @post.touch
      redirect_to board_post_path(@board, @post), notice: 'Reply was successfully created.'
    else
      flash[:errors] = @reply.errors.full_messages
      redirect_to board_post_path(@board, @post)
    end
  end

  ##
  # POST /boards/:board_id/posts/:post_id/replies/:reply_id/flag
  def flag
    @reply.flagged = true

    if @reply.save
      redirect_to board_post_path(@board, @post), notice: 'Reply was successfully flagged.'
    else
      redirect_to board_post_path(@board, @post), notice: 'An error occurred when attempting to flag this reply.'
    end
  end

  ##
  # POST /boards/:board_id/posts/:post_id/replies/:reply_id/unflag
  def unflag
    @reply.flagged = false
    @reply.cleared = true

    if @reply.save
      redirect_to board_post_path(@board, @post), notice: 'Reply was successfully unflagged.'
    else
      redirect_to board_post_path(@board, @post), notice: 'An error occurred when attempting to unflag this reply.'
    end
  end

  ##
  # DELETE /boards/:board_id/posts/:post_id/replies/:reply_id
  def destroy
    @reply.destroy
    redirect_to board_post_path(@board, @post), notice: 'Reply was successfully destroyed.'
  end

  private

  ##
  # Set reply for an action.
  def set_reply
    @reply = Reply.find(params[:id])
  end

  ##
  # Set post for an action.
  def set_post
    @post = Post.find(params[:post_id])
  end

  ##
  # Set post replies for an action.
  def set_post_replies
    @post_replies = @post.replies.all
  end

  ##
  # Set board for an action.
  def set_board
    @board = Board.find(params[:board_id])
  end

  ##
  # Returns an array containing all reply IDs for a post.
  def get_reply_ids(replies)
    reply_ids = []
    replies.each do |reply|
      reply_ids.push(reply.id)
    end
    reply_ids
  end

  ##
  # Determines if provided reply-to value is valid.
  def reply_to_valid?(rt, ids)
    ids.include?(rt)
  end

  ##
  # Process parameters for reply requests.
  def reply_params
    params.require(:reply).permit(:poster, :body, :parent_id, :post_id, :board_id)
  end
end
