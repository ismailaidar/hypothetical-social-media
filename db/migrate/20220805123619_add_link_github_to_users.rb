class AddLinkGithubToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :link_github, :boolean, default: false
  end
end
