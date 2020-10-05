require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @user.image = fixture_file_upload('app/assets/images/dancer.png')
  end

  describe 'ユーザー新規登録' do
    before do
      #ユーザー新規登録では設定しないため除外
      @user.remark = ""
      @user.image = nil
    end
    context "ユーザーの新規登録に成功する場合" do
      it 'nicknameとemail、passwordとpassword_confirmationとdance_level_id存在すれば登録できること' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できること' do
        @user.password = '123abc'
        @user.password_confirmation = '123abc'
        expect(@user).to be_valid
      end
    end
    context "ユーザーの新規登録に失敗する場合" do
      it 'nicknameが空では登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'passwordは半角数字のみでは登録できないこと' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors[:password]).to include('には英字と数字の両方を含めて設定してください')
      end
      it 'passwordは半角英字のみでは登録できないこと' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors[:password]).to include('には英字と数字の両方を含めて設定してください')
      end
      it 'usernameは16文字以上では登録できないこと' do
        @user.nickname = 'a' * 16
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームは15文字以内で入力してください')
      end
      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        second_user = FactoryBot.build(:user, email: @user.email, image: nil)
        second_user.valid?
        expect(second_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'dance_level_idが【ダンス歴未設定】だと登録できないこと' do
        @user.dance_level_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to  include('ダンス歴は【ダンス歴未設定】以外の値にしてください')
      end
    end
  end

  describe 'ユーザー編集' do
    context "ユーザーの編集に成功する場合" do
      it 'remarkが空でも登録できること' do
        @user.remark = nil
        expect(@user).to be_valid
      end
      it 'imageが空でも登録できること' do
        @user.image = nil
        expect(@user).to be_valid
      end
    end
    context "ユーザーの編集に失敗する場合" do
      it 'remarkは201文字以上では登録できないこと' do
        @user.remark = 'a' * 201
        @user.valid?
        expect(@user.errors.full_messages).to include('自己紹介は200文字以内で入力してください')
      end
      it 'imageの拡張子は.jpeg, .jpg, .gif, .png, .bmp以外では登録できないこと' do
        @user.image = fixture_file_upload('app/assets/images/test.eps')
        @user.valid?
        expect(@user.errors.full_messages).to include('ユーザーアイコン画像の拡張子が間違っています')
      end
    end
  end
end
