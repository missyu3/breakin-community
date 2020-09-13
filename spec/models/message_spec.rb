require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end

  describe 'メッセージ新規投稿' do
    it 'textが空だと投稿できない' do
      @message.text = ''
      @message.valid?
      expect(@message.errors.full_messages).to include 'テキストを入力してください'
    end

    it 'userが紐づいていないと投稿できない' do
      @message.user = nil
      @message.valid?
      expect(@message.errors.full_messages).to include 'Userを入力してください'
    end
    it 'placeが紐づいていないと投稿できない' do
      @message.place = nil
      @message.valid?
      expect(@message.errors.full_messages).to include 'Placeを入力してください'
    end
  end
end
