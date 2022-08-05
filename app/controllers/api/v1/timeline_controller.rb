class Api::V1::TimelineController < ApplicationController
  def index
    data = []
    data.push(get_local_activities)

    github_events = GithubEvents.new(@current_user[:username])
    data.push(github_events.get_recent_repos)
    data.push(github_events.get_new_pull_requests)

    render json: data, status: :ok
  end

  private
  def get_local_activities
    data = []
    # get the posts that were recently commented on
    posts = Post.joins(:comments).where("comments.user_id = ?", @current_user.id)
                                  .order("comments.updated_at").distinct
    data.append(posts)
    # get the posts that were recently created by the current user
    posts = Post.where(user: @current_user).order("updated_at desc")
    data.append(posts)
    data = data.flatten.uniq
    data
  end
end