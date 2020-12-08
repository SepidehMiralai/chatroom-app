require 'rails_helper'
# require '../support/json_api_helpers'

describe Api::V1::RoomsController do
  describe "#index" do
    subject {get :index}
    it "should return success response" do
      subject
      expect(response).to have_http_status(:ok)
    end
  end
end