class PostsController < ApplicationController
  before_action :set_post, only: %i[show destroy]
  before_action :set_board, only: %i[create show]
  before_action :protect_admin_resources, only: :destroy
  invisible_captcha only: :create

  ##
  # GET /boards/:board_id/posts/:post_id
  def show
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

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    redirect_to dashboard_path, notice: 'Post was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  ##
  # Use callbacks to share common setup or constraints between actions.
  def set_board
    @board = Board.find(params[:board_id])
  end

  ##
  # Protects against directory traversal
  def protect_admin_resources
    head status: :unauthorized unless current_user.admin?
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:poster, :subject, :body, :board_id, :reply_id)
  end
end
