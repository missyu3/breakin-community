require 'rails_helper'

RSpec.describe "Places", type: :system do
  describe '練習場所新規登録' do
    before do
      @user = FactoryBot.create(:user)
    end
    
    context '練習場所の新規登録ができるとき' do
      it '正しい情報を入力すれば練習場所の新規登録ができてトップページに移動する' do
        sign_in(@user)
        visit new_place_path
        fill_in 'place_name', with: '体育館'
        fill_in 'place_price', with: '１時間１００円かかります'

        #googlemap上をクリックしたときの動作
        fill_in 'place_address', with: '京都'
        first('input#lat', visible: false).set("50")
        first('input#lng', visible: false).set("100")

        expect{
          find('input[name="commit"]').click
        }.to change {Place.count}.by(1)
        expect(current_path).to eq root_path 
      end
    end
    context '練習場所の新規登録ができないとき' do
      it '誤った情報では練習場所の新規登録ができない' do
        sign_in(@user)
        visit new_place_path
        fill_in 'place_name', with: ''
        fill_in 'place_price', with: ''
        expect{
          find('input[name="commit"]').click
        }.to change {Place.count}.by(0)
      end
      it 'googlemapをクリックせずに住所を手入力すると練習場所の新規登録ができない' do
        sign_in(@user)
        visit new_place_path
        fill_in 'place_name', with: '体育館'
        fill_in 'place_price', with: '１時間１００円かかります'
        fill_in 'place_address', with: '京都'
        expect{
          find('input[name="commit"]').click
        }.to change {Place.count}.by(0)
      end
    end
  end
  describe '練習場所編集' do
    before do
      @user = FactoryBot.create(:user)
      @place = FactoryBot.create(:place)
      @place.image = fixture_file_upload('app/assets/images/default_place.png')
      @user_place = UserPlace.create(user_id: @user.id, place_id: @place.id)
      @another_user = FactoryBot.create(:user)
      @another_place = FactoryBot.create(:place)
      @another_user_place = UserPlace.create(user_id: @another_user.id, place_id: @another_place.id)
    end
    
    context '練習場所の編集ができるとき' do
      it '自分で登録した練習場所ならば練習場所の編集ができる' do
        sign_in(@user)
        visit user_path(@user)
        expect(page).to have_content(@place.name)  
        visit  new_place_message_path(@place)
        expect(page).to have_content('編集')  
      end
    end
    context '練習場所の編集ができないとき' do
      it '他のユーザーが登録した練習場所ならば練習場所の編集はできない' do
        sign_in(@user)
        visit  new_place_message_path(@another_place)
        expect(page).to have_no_content('編集')  
      end
    end
  end
  describe '練習場所削除' do
    before do
      @user = FactoryBot.create(:user)
      @place = FactoryBot.create(:place)
      @place.image = fixture_file_upload('app/assets/images/default_place.png')
      @user_place = UserPlace.create(user_id: @user.id, place_id: @place.id)
      @another_user = FactoryBot.create(:user)
      @another_place = FactoryBot.create(:place)
      @another_user_place = UserPlace.create(user_id: @another_user.id, place_id: @another_place.id)
    end
    
    context '練習場所の削除ができるとき' do
      it '自分で登録した練習場所ならば練習場所の削除ができる' do
        sign_in(@user)
        visit user_path(@user)
        expect(page).to have_content(@place.name)  
        visit  new_place_message_path(@place)
        expect(page).to have_content('削除')  
      end
    end
    context '練習場所の削除ができないとき' do
      it '他のユーザーが登録した練習場所ならば練習場所の削除はできない' do
        sign_in(@user)
        visit  new_place_message_path(@another_place)
        expect(page).to have_no_content('削除')  
      end
    end
  end
end
