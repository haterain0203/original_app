class PostsController < ApplicationController
  before_action :correct_user,   only: :destroy

  def index
    @posts = Post.page(params[:page]).per(10).sorted
    @post = Post.new
    @comments = @post.comments
    @comment = Comment.new
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.sorted
    @comment = Comment.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_back(fallback_location: root_path)
    else
      @posts = Post.page(params[:page]).per(10).sorted
      render "index"
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to request.referrer || root_url
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url if @post.nil?
  end

end
