class PostRepresenter
  def initialize(post)
    @post = post
  end

  def as_json
    {
      id: @post.id,
      title: @post.title,
      body: @post.body,
      user: @post.user,
      user_rate: @post.user.rating,
      created_at: @post.created_at,
      updated_at: @post.updated_at
    }
  end

  private 
  attr_reader :posts
end