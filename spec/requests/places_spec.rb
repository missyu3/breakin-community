require 'rails_helper'

RSpec.describe "Places", type: :request do
  before do
    @place = FactoryBot.create(:place)

  end
  describe "GET /places" do
    it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do
      get places_path
      expect(response).to have_http_status(200)
    end
    it "newアクションにリクエストするとログインページへリダイレクトされる" do
      get new_place_path
      expect(response).to have_http_status(302)
    end
    it "editアクションにリクエストするとログインページへリダイレクトされる" do
      get edit_place_path(@place.id)
      expect(response).to have_http_status(302)
    end
  end
end
