require 'rails_helper'

RSpec.describe 'Messages', type: :system do
  describe 'チャット新規作成' do
    before do
      @user = FactoryBot.create(:user)
      @place = FactoryBot.create(:place)
      @place.image = fixture_file_upload('app/assets/images/default_place.png')
      @user_place = UserPlace.create(user_id: @user.id, place_id: @place.id)
      @another_user = FactoryBot.create(:user)
      @another_place = FactoryBot.create(:place)
      @another_user_place = UserPlace.create(user_id: @another_user.id, place_id: @another_place.id)
    end

    context 'チャットの新規作成ができるとき' do
      it '自分で登録した練習場所ならばチャットの新規作成ができる' do
        sign_in(@user)
        visit user_path(@user)
        expect(page).to have_content(@place.name)
        visit new_place_message_path(@place)
        fill_in 'textField', with: 'よろしく'
        find('.commit').click
        visit  new_place_message_path(@place) # actioncableを用いた非同期通信のためリロードする
        change { Message.count}.by(1)
      end
      it '自分のチャットは右側に表示される' do
        sign_in(@user)
        visit new_place_message_path(@place)
        fill_in 'textField', with: 'よろしく'
        find('.commit').click
        visit new_place_message_path(@place) # actioncableを用いた非同期通信のためリロードする
        expect(page).to have_selector '.message-content-right'
      end
      it '他のユーザーのチャットは左側に表示される' do
        Message.create(text: 'anotheruserです', user_id: @another_user.id, place_id: @another_place.id)
        sign_in(@user)
        visit new_place_message_path(@another_place)
        expect(page).to have_selector '.message-content-left'
      end
    end
    context 'チャットの新規作成ができないとき' do
      it 'チャットに参加していなければチャットの新規作成ができない' do
        sign_in(@user)
        visit new_place_message_path(@another_place)
        expect(page).to have_no_selector '#textField'
      end
    end
  end
end
