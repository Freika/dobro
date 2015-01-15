class PostsController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  def index
    @posts = current_user.posts.order(created_at: :desc).page(params[:page])
    respond_with(@posts)
  end

  def show
    @post = set_post
    respond_with(@post)
  end

  def new
    @post = Post.new
    if current_user.posts.count > 0
      if current_user.posts.last.created_at.to_date == Time.zone.today
        redirect_to posts_path, notice: "Сегодня вы уже создавали запись ԅ[ •́ ﹏ •̀ ]و Если хотите что-то добавить, пожалуйста,отредактируйте вашу сегодняшнюю публикацию"
      end
    else
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

  def last_week
    @posts = current_user.posts.where('created_at >= ?', Time.zone.today.beginning_of_week)
  end

  def last_month
    @posts = current_user.posts.weekly.where('created_at >= ?', Time.zone.today.beginning_of_month)
  end

  def week
    year = params[:year].to_i
    week = params[:week].to_i
    @week_start = Date.commercial(year, week, 1)
    @week_end = Date.commercial(year, week, 7)
    @posts = current_user.posts.where(created_at: @week_start..@week_end).order(created_at: :asc)
  end

  def month
    @year = params[:year].to_i
    @month = params[:month].to_i
    @month_start = Date.new(@year, @month, 1)
    @month_end = @month_start.end_of_month
    @posts = current_user.posts.weekly.where(created_at: @month_start..@month_end)
  end

  def period
    @weeks = current_user.posts.group_by { |post| post.created_at.strftime("%U") }
    @months = current_user.posts.group_by { |post| post.created_at.strftime("%B") }
  end

  private
    def set_post
      @post = current_user.posts.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:content, :status, :created_at)
    end
end
