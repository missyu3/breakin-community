require 'rails_helper'

RSpec.describe "Users", type: :system do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)

    end
    context 'ユーザー新規登録ができるとき' do
      it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
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
      @another_user = FactoryBot.create(:user)
    end
    
    context 'ユーザープロフィール' do
      it 'ログインしていなくても他のユーザーのプロフィールが見れる' do
        visit user_path(@another_user)
        expect(page).to have_content("#{@another_user.nickname}")
      end
      it 'ユーザーアイコン画像と自己紹介を追記するとマイページに表示される' do
        sign_in(@user)
        visit edit_user_path(@user)
        user_remark_sample = "test"
        fill_in '自己紹介', with: "#{user_remark_sample}"
        attach_file 'user_image', "app/assets/images/default_place.png"
        find('input[name="commit"]').click
        expect(current_path).to eq user_path(@user)
        expect(page).to have_content(user_remark_sample)
        expect(page).to have_selector("img[src$='default_place.png']")
      end
      it 'ダンス歴がみる方が好きならユーザーアイコンの背景が赤色である' do
        sign_in(@user)
        visit edit_user_path(@user)
        select '【ダンスは見る方が好き】', from: 'ダンス歴'
        find('input[name="commit"]').click
        expect(page).to have_css '.user-image2'
      end
      it 'ダンス歴が0~2年ならユーザーアイコンの背景が水色である' do
        sign_in(@user)
        visit edit_user_path(@user)
        select '【ダンス歴 0 ~ 2年(初心者レベル)】', from: 'ダンス歴'
        find('input[name="commit"]').click
        expect(page).to have_css '.user-image3'
      end
      it 'ダンス歴が2~5年ならユーザーアイコンの背景が赤紫色である' do
        sign_in(@user)
        visit edit_user_path(@user)
        select '【ダンス歴 2 ~ 5年(中級者レベル)】', from: 'ダンス歴'
        find('input[name="commit"]').click
        expect(page).to have_css '.user-image4'
      end
      it 'ダンス歴が5~10年ならユーザーアイコンの背景が金色である' do
        sign_in(@user)
        visit edit_user_path(@user)
        select '【ダンス歴 5 ~ 10年(上級者レベル)】', from: 'ダンス歴'
        find('input[name="commit"]').click
        expect(page).to have_css '.user-image5'
      end
      it 'ダンス歴が10年~ならユーザーアイコンの背景が虹色である' do
        sign_in(@user)
        visit edit_user_path(@user)
        select '【ダンス歴 10年 ~ (指導者・プロレベル)】', from: 'ダンス歴'
        find('input[name="commit"]').click
        expect(page).to have_css '.user-image6'
      end
    end
    context 'よく使う練習場所' do
      before do
        @place = FactoryBot.create(:place)
        @another_user_place = UserPlace.create(user_id: @another_user.id, place_id: @place.id)
      end
      it 'ログインしていなくても他のユーザーのよく使う練習場所を見ることができる' do
        visit user_path(@another_user)
        expect(page).to have_content(@place.name)
      end
      it '練習場所を新しく登録するとマイページに表示される' do
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
        }.to change {UserPlace.count}.by(1)
        visit user_path(@user)
        expect(page).to have_content('体育館')
      end
      it '練習場所のチャットページからチャットに参加するとマイページに表示される' do
        sign_in(@user)
        visit new_place_message_path(@place)
        expect(page).to have_button 'チャットに参加'
        expect{
          find("input[name='commit']").click
        }.to change {UserPlace.count}.by(1)
        visit user_path(@user)
        expect(page).to have_content(@place.name)
      end
      it '練習場所に参加していなければ練習場所のチャット参加や登録を促される' do
        sign_in(@user)
        visit user_path(@user)
        expect(page).to have_content('自分だけの新しい練習場所を共有しよう')
        expect(page).to have_content('練習場所のチャットに参加してみよう')
      end
    end
    context 'フォローフォロワー' do
      it 'ログインしていなければフォローできない' do
        visit user_path(@another_user)
        expect(page).to have_no_content("フォローする")
      end
      it '他のユーザーをフォローするとフォロー済みと表示される' do
        sign_in(@user)
        visit user_path(@another_user)
        expect(page).to have_content("フォローする")
        expect{
          click_on 'フォローする'
        }.to change {Relationship.count}.by(1) 
        expect(page).to have_content("フォロー済み")
      end
      it '他のユーザーをフォローするとマイページのフォロー数が増える' do
        sign_in(@user)
        visit user_path(@another_user)
        click_on 'フォローする'
        visit followers_user_path(@user)
        expect(page).to have_content(@another_user.nickname)
      end
      it '他のユーザーからフォローされるとマイページのフォロワー数が増える' do
        Relationship.create(following_id:@another_user.id , follower_id:@user.id)
        sign_in(@user)
        visit follows_user_path(@user)
        expect(page).to have_content(@another_user.nickname)
      end
      it 'フォローを取り消すことができる', js: true do
        Relationship.create(following_id:@user.id , follower_id:@another_user.id)
        sign_in(@user)
        visit user_path(@another_user)
        expect(page).to have_content('フォロー済み')
        click_on 'フォロー済み'
        expect{
          expect(page.accept_confirm).to eq "フォローを解除してもよろしいですか？"
          expect(page).to have_content('フォローする')
        }.to change{Relationship.count}.by(-1)
      end
    end
  end
end