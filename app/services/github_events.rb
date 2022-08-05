require 'uri'
require 'net/http'

class GithubEvents
  def initialize(username)
    @username = username
    @client = Octokit::Client.new
    @user = @client.user @username
  end

  def get_recent_repos
    repos = @user.rels[:repos].get.data.sort {|rep| rep[:updated_at]}
    repos = repos.map {|repo| repo[:name]}
    {
      "repos" => repos.take(5)
    }
  end

  def get_new_pull_requests
    # TODO: get the latest pull request from github
  end
end