require "test_helper"

class RatingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rating = ratings(:one)
  end

  test "should get index" do
    get ratings_url, as: :json
    assert_response :success
  end

  test "should create rating" do
    assert_difference("Rating.count") do
      post ratings_url, params: { rating: { rater_id: @rating.rater_id, stars: @rating.stars, user_id: @rating.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show rating" do
    get rating_url(@rating), as: :json
    assert_response :success
  end

  test "should update rating" do
    patch rating_url(@rating), params: { rating: { rater_id: @rating.rater_id, stars: @rating.stars, user_id: @rating.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy rating" do
    assert_difference("Rating.count", -1) do
      delete rating_url(@rating), as: :json
    end

    assert_response :no_content
  end
end
