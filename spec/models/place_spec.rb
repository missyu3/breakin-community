require 'rails_helper'

RSpec.describe Place, type: :model do
  before do
    @place = FactoryBot.build(:place)
    @place.image = fixture_file_upload('app/assets/images/default_place.png')
  end

  describe '練習場所新規登録' do
    context "練習場所の新規登録に成功する場合" do
      it 'nameとaddressとpriceが存在すれば登録できること' do
        expect(@place).to be_valid
      end
      it 'remarkが空でも登録できること' do
        @place.remark = ""
        expect(@place).to be_valid
      end
      it 'urlが空でも登録できること' do
        @place.url = ""
        expect(@place).to be_valid
      end
      it 'imageが空でも登録できること' do
        @place.image = nil
        expect(@place).to be_valid
      end
    end
    context "練習場所の新規登録に失敗する場合" do
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
      it 'nameが15文字より多いと登録できない' do
        @place.name = 'a' * 16
        @place.valid?
        expect(@place.errors.full_messages).to include '名前は15文字以内で入力してください'
      end
      it 'addressが40文字より多いと登録できない' do
        @place.address = 'a' * 41
        @place.valid?
        expect(@place.errors.full_messages).to include '住所は40文字以内で入力してください'
      end
      it 'priceが50文字より多いと登録できない' do
        @place.price = 'a' * 51
        @place.valid?
        expect(@place.errors.full_messages).to include '金額は50文字以内で入力してください'
      end
      it 'urlが50文字より多いと登録できない' do
        @place.url = 'a' * 51
        @place.valid?
        expect(@place.errors.full_messages).to include 'URLは50文字以内で入力してください'
      end
      it 'remarkが80文字より多いと登録できない' do
        @place.remark = 'a' * 81
        @place.valid?
        expect(@place.errors.full_messages).to include '備考欄は80文字以内で入力してください'
      end
      it 'latが-90より小さいと登録できない' do
        @place.lat = -90.1
        @place.valid?
        expect(@place.errors.full_messages).to include 'Latは-90以上の値にしてください'
      end
      it 'latが90より大きいと登録できない' do
        @place.lat = 90.1
        @place.valid?
        expect(@place.errors.full_messages).to include 'Latは90以下の値にしてください'
      end
      it 'lngが-180より小さいと登録できない' do
        @place.lng = -180.1
        @place.valid?
        expect(@place.errors.full_messages).to include 'Lngは-180以上の値にしてください'
      end
      it 'lngが180より大きいと登録できない' do
        @place.lng = 180.1
        @place.valid?
        expect(@place.errors.full_messages).to include 'Lngは180以下の値にしてください'
      end
      it 'imageの拡張子は.jpeg, .jpg, .gif, .png, .bmp以外では登録できないこと' do
        @place.image = fixture_file_upload('app/assets/images/test.eps')
        @place.valid?
        expect(@place.errors.full_messages).to include('画像の拡張子が間違っています')
      end
      it 'urlはhttpかhttpsを含んでいないと登録できないこと' do
        @place.url = "www.hoge.com"
        @place.valid?
        expect(@place.errors.full_messages).to include('URLにはhttpまたはhttpsを含む必要があります')
      end
    end
  end
end
