class ApplicationController < ActionController::API
  include JsonWebToken
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordNotDestroyed, with: :record_not_destroyed

  before_action :authenticate_request

  private
  def authenticate_request
    header = request.headers["Authorization"]
    header = header.split(" ").last if header
    decoded = jwt_decode(header)
    @current_user = User.find(decoded[:user_id])
  end

  def record_not_found
    render json: { message: "Record not found" }, status: :not_found
  end

  def record_not_destroyed
    render json: { message: "Record not destroyed" }, status: :unprocessable_entity
  end
end
