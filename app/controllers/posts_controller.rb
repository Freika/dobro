class PostsController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  def index
    @posts = current_user.posts.order(created_at: :desc)
    respond_with(@posts)
  end

  def show
    @post = set_post
    respond_with(@post)
  end

  def new
    if current_user.posts.count > 0
      if current_user.posts.last.created_at.to_date == Time.zone.today
        redirect_to posts_path, notice: "Сегодня вы уже создавали запись ԅ[ •́ ﹏ •̀ ]و Если хотите что-то добавить, пожалуйста,отредактируйте вашу сегодняшнюю публикацию"
      end
    else
      @post = Post.new
      respond_with(@post)
    end
  end

  def edit
    @post = set_post
    authorize! :edit, @post, notice: 'Сегодня вы уже создавали запись!'
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
