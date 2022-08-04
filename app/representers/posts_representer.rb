class PostsRepresenter
  def initialize(posts)
    @posts = posts
  end

  def as_json
    posts.map do |post| 
      {
        id: post.id,
        title: post.title,
        body: post.body,
        user: post.user,
        user_rate: post.user.rating,
        created_at: post.created_at,
        updated_at: post.updated_at
      }
    end
  end

  private 
  attr_reader :posts
end