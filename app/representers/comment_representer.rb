class CommentRepresenter
  def initialize(comment)
    @comment = comment
  end

  def as_json
    {
      id: @comment.id,
      body: @comment.body,
      user: @comment.user,
      user_rate: @comment.user.rating,
      created_at: @comment.created_at,
      updated_at: @comment.updated_at
    }
  end

  private 
  attr_reader :comment
end