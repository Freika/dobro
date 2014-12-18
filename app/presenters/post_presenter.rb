class PostPresenter < BasePresenter
  presents :post

  def status_label
    h.status_label(post) if post.status
  end

end
