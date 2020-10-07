require 'rails_helper'

RSpec.describe "Messages", type: :request do
  before do
    @message = FactoryBot.create(:message)
    @place = FactoryBot.create(:place)
  end

  describe "GET /messages" do
    it 'newアクションにリクエストすると正常にレスポンスが返ってくる' do
      get  new_place_message_path(@place.id)
      expect(response).to have_http_status(200)
    end
  end
end
