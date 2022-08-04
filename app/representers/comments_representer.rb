class CommentsRepresenter
  def initialize(comments)
    @comments = comments
  end

  def as_json
    comments.map do |comment| 
      {
        id: comment.id,
        body: comment.body,
        post: comment.post,
        user: comment.user,
        user_rate: comment.user.rating,
        created_at: comment.created_at,
        updated_at: comment.updated_at
      }
    end
  end

  private 
  attr_reader :comments
end