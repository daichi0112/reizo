require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '新規登録フォームに正しい情報が存在すれば、登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
    end

    it '重複したemailが存在する場合、登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
    end

    it 'emailに@が存在しない場合、登録できないこと' do
      @user.email = '1234abcd.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('メールアドレスは不正な値です')
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

    it 'passwordが6文字以上であれば、登録できること' do
      @user.password = 'abcd56'
      @user.password_confirmation = 'abcd56'
      expect(@user).to be_valid
    end

    it 'passwordが5文字以下である場合、登録できないこと' do
      @user.password = 'abc45'
      @user.password_confirmation = 'abc45'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end

    it 'passwordが半角英数字混合でない場合、登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは半角英数字で入力してください')
    end

    it 'password_confirmationが空では、登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("確認用パスワードとパスワードの入力が一致しません")
    end

    it 'passwordとpassword_confirmationが不一致では、登録できないこと' do
      @user.password_confirmation = '9876abc'
      @user.valid?
      expect(@user.errors.full_messages).to include("確認用パスワードとパスワードの入力が一致しません")
    end
  end
end
