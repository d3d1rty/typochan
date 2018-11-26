class RepliesController < ApplicationController
  before_action :set_reply, only: :destroy
  before_action :set_post, only: :create
  before_action :set_post_replies, only: :create
  before_action :set_board, only: :create
  before_action :protect_admin_resources, only: :destroy
  invisible_captcha only: :create

  def create
    @reply = @post_replies.new
    @reply.poster = signed_in? ? current_user.handle : 'Anon'
    @reply.body = reply_params[:body]
    @reply.parent = Reply.find(reply_params[:parent_id]) if reply_to_valid?(reply_params[:parent_id].to_i, get_reply_ids(@post_replies))

    if @reply.save
      redirect_to board_post_path(@board, @post), notice: 'Reply was successfully created.'
    else
      flash[:errors] = @reply.errors.full_messages
      redirect_to board_post_path(@board, @post)
    end
  end

  def destroy
    @reply.destroy
    redirect_to dashboard_path, notice: 'Reply was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reply
    @reply = Reply.find(params[:id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:post_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_post_replies
    @post_replies = @post.replies.all
  end

 ##
  # Use callbacks to share common setup or constraints between actions.
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
  # Protects against directory traversal
  def protect_admin_resources
    head status: :unauthorized unless current_user.admin?
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def reply_params
    params.require(:reply).permit(:poster, :body, :parent_id, :post_id, :board_id)
  end
end
