class Api::V1::TimelineController < ApplicationController
  def index
    # get the posts that were recently commented on
    data = []
    posts = Post.joins(:comments).where(user: @current_user).order("comments.updated_at").distinct
    data.append(posts)
    # get the posts that were recently created by the current user
    posts = Post.where(user: @current_user).order("updated_at desc")
    data.append(posts)
    data = data.flatten.uniq
    render json: data, status: :ok
  end

end