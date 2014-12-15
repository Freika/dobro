class PostsController < ApplicationController

  respond_to :html

  def index
    @posts = current_user.posts
    respond_with(@posts)
  end

  def show
    @post = set_post
    respond_with(@post)
  end

  def new
    @post = Post.new
    respond_with(@post)
  end

  def edit
    @post = set_post
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.save
    respond_with(@post)
  end

  def update
    @post = set_post
    @post.update(post_params)
    respond_with(@post)
  end

  def destroy
    @post = set_post
    @post.destroy
    respond_with(@post)
  end

  private
    def set_post
      @post = current_user.posts.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:content)
    end
end
