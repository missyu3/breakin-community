require 'rails_helper'

RSpec.describe Place, type: :model do
  before do
    @place = FactoryBot.build(:place)
  end

  describe '練習場所新規登録' do
    it 'nameが空だと登録できない' do
      @place.name = ''
      @place.valid?
      expect(@place.errors.full_messages).to include '名前を入力してください'
    end
    it 'addressが空では登録できない' do
      @place.address = ''
      @place.valid?
      expect(@place.errors.full_messages).to include '住所を入力してください'
    end
    it 'priceが空では登録できない' do
      @place.price = ''
      @place.valid?
      expect(@place.errors.full_messages).to include '金額を入力してください'
    end
    it 'nameが40文字より多いと登録できない' do
      @place.name = 'a' * 41
      @place.valid?
      expect(@place.errors.full_messages).to include '名前は40文字以内で入力してください'
    end
    it 'addressが80文字より多いと登録できない' do
      @place.address = 'a' * 81
      @place.valid?
      expect(@place.errors.full_messages).to include '住所は80文字以内で入力してください'
    end
    it 'priceが100文字より多いと登録できない' do
      @place.price = 'a' * 101
      @place.valid?
      expect(@place.errors.full_messages).to include '金額は100文字以内で入力してください'
    end
    it 'addressがgooglemapに登録されている地点でないと登録できない' do
    end
  end
end
