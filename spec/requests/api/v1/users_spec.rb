require 'rails_helper'


RSpec.describe "/api/v1/users", type: :request do
  
  let(:valid_attributes) {
    {
      "id": 8,
      "username": "testuser",
      "email": "test@email.com",
      "password": "123456"
    }
  }

  let(:invalid_attributes) {
    {
      "username": "testuser",
      "password": "123456"
    }
  }

  let(:valid_headers) {
    {
      'HTTP_ACCEPT' => "application/json",
      'Content-Type' => 'application/json',
      'Authorization' => 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo4LCJleHAiOjE2NjA0Nzg2OTR9.2wD_2ctPepoND6_JsEdUmAYG5zh8cVKYFJYq2-IxPL4'
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      User.create! valid_attributes
      get api_v1_users_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      user = User.create! valid_attributes
      get api_v1_user_url(user), headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new User" do
        expect {
          post api_v1_users_url,
               params: { user: valid_attributes }, headers: valid_headers, as: :json
        }.to change(User, :count).by(1)
      end

      it "renders a JSON response with the new api_v1_user" do
        post api_v1_users_url,
             params: { user: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new User" do
        expect {
          post api_v1_users_url,
               params: { user: invalid_attributes }, as: :json
        }.to change(User, :count).by(0)
      end

      it "renders a JSON response with errors for the new api_v1_user" do
        post api_v1_users_url,
             params: { user: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end
end
