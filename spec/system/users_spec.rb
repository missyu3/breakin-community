require 'rails_helper'

RSpec.describe "Users", type: :system do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    context 'ユーザー新規登録ができるとき' do
      it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
        visit root_path
        expect(page).to have_content('ログイン')
        visit  new_user_session_path
        expect(page).to have_content('Sign up')
        visit new_user_registration_path
        fill_in 'user_nickname', with: @user.nickname
        fill_in 'user_email', with: @user.email
        fill_in 'user_password', with: @user.password
        fill_in 'user_password_confirmation', with: @user.password_confirmation
        select '【ダンスは見る方が好き】', from: 'ダンス歴'
        expect{
          find('input[name="commit"]').click
        }.to change { User.count }.by(1)
        expect(current_path).to eq root_path
      end
    end
    context 'ユーザー新規登録ができないとき' do
      it '誤った情報ではユーザー新規登録ができない' do
        visit root_path
        expect(page).to have_content('ログイン')
        visit  new_user_session_path
        expect(page).to have_content('Sign up')
        visit new_user_registration_path
        fill_in 'user_nickname', with: ""
        fill_in 'user_email', with: ""
        fill_in 'user_password', with: ""
        fill_in 'user_password_confirmation', with: ""
        expect{
          find('input[name="commit"]').click
        }.to change {User.count}.by(0)
      end
      it 'ダンス歴を設定しなければユーザー新規登録ができない' do
        visit root_path
        expect(page).to have_content('ログイン')
        visit  new_user_session_path
        expect(page).to have_content('Sign up')
        visit new_user_registration_path
        select '【ダンス歴未設定】', from: 'ダンス歴'
        expect{
          find('input[name="commit"]').click
        }.to change {User.count}.by(0)
      end
    end
  end
  describe 'ユーザーログイン' do
    before do
      @user = FactoryBot.create(:user)
    end

    context 'ユーザーログインができる時' do
      it '保存されているユーザーの情報と合致すればログインができる' do
        sign_in(@user)
        expect(page).to have_content('ログアウト')  
      end
    end
    context 'ユーザーログインができない時' do
      it '保存されているユーザーの情報と合致しないとログインができない' do
        visit  new_user_session_path
        fill_in 'user_email', with: ""
        fill_in 'user_password', with: ""
        find('input[name="commit"]').click
        expect(current_path).to eq new_user_session_path  
      end
    end
  end
  describe 'ユーザーマイページ' do
    before  do
      @user = FactoryBot.create(:user)
    end
    
    context 'ユーザープロフィール' do
      it 'ログインしていなくても他のユーザーのプロフィールが見れる' do
      end
      it 'ユーザーアイコン画像と自己紹介を追記するとマイページに表示される' do
        sign_in(@user)
      end
      it 'ユーザーアイコ自己紹介を追記するとマイページに表示される' do
      end
      it 'プロフィールを追記していなければデフォルトの画像がマイページに表示される' do
      end
      it 'ダンス歴が0~2年ならユーザーアイコンの背景が水色である' do
      end
      it 'ダンス歴が2~5年ならユーザーアイコンの背景が赤紫色である' do
      end
      it 'ダンス歴が5~10年ならユーザーアイコンの背景が金色である' do
      end
      it 'ダンス歴が10年~ならユーザーアイコンの背景が虹色である' do
      end
    end
    context 'よく使う練習場所' do
      it 'ログインしていなくても他のユーザーのよく使う練習場所を見ることができる' do
      end
      it '練習場所を新しく登録するとマイページに表示される' do
      end
      it '練習場所のチャットページからチャットに参加するとマイページに表示される' do
      end
      it '練習場所に参加していなければ練習場所のチャット参加や登録を促される' do
      end
    end
    context 'フォローフォロワー' do
      it 'ログインしていなければフォローできない' do
      end
      it '他のユーザーをフォローするとフォロー済みと表示される' do
      end
      it '他のユーザーをフォローするとマイページのフォロー数が増える' do
      end
      it '他のユーザーをフォローするとマイページのフォローページに表示される' do
      end
      it '他のユーザーからフォローされるとマイページのフォロワー数が増える' do
      end
      it '他のユーザーからフォローされるとフォロワーページに表示される' do
      end
      it 'フォローを取り消すことができる' do
      end
    end
  end
end