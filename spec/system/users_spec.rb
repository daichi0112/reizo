require 'rails_helper'

def basic_pass(path)
  username = ENV['BASIC_AUTH_USER']
  password = ENV['BASIC_AUTH_PASSWORD']
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe '新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザーが新規登録できる時' do
    it '正しい情報を入力すれば、ユーザー新規登録ができてトップページに移動する' do
      # トップページから新規登録ページへ移動する
      sign_up
      # ユーザー情報を入力する
      fill_in 'user_nickname', with: @user.nickname
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      fill_in 'user_password_confirmation', with: @user.password_confirmation
      # 登録ボタンをクリックすると、ユーザーモデルのカウントが1上がることを確認する
      expect  do
        click_on('登録する')
      end.to change { User.count }.by(1)
      # トップページへ遷移する
      expect(current_path).to eq root_path
      # ログアウトボタンが表示されていることを確認する
      expect(page).to have_content('ログアウト')
      # 登録したユーザーのニックネームが表示されていることを確認する
      expect(page).to have_content(@user.nickname)
      # 新規登録ボタンやログインボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end

  context 'ユーザーが新規登録できない時' do
    it '誤った情報ではユーザー新規登録ができず、再び新規登録ページにてエラーメッセージが表示される' do
      # トップページから新規登録ページへ移動する
      sign_up
      # 誤ったユーザー情報を入力する
      fill_in 'user_nickname', with: ''
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: ''
      fill_in 'user_password_confirmation', with: ''
      # 登録ボタンをクリックしても、ユーザーモデルのカウントは上らないことを確認する
      expect  do
        click_on('登録する')
      end.to change { User.count }.by(0)
      # 新規登録ページへ戻されることを確認する
      expect(current_path).to eq user_registration_path
      # エラーメッセージが表示されていることを確認する
      expect(page).to have_content('ニックネームを入力してください')
      expect(page).to have_content('Eメールを入力してください')
      expect(page).to have_content('パスワードを入力してください')
      expect(page).to have_content('パスワードは半角英数字で入力してください')
    end
  end
end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context 'ユーザーがログインできる時' do
    it '保存されているユーザーの情報と合致すれば、ログインできてトップページに移動する' do
      # ログインする
      log_in(@user)
      # ログアウトボタンが表示されていることを確認する
      expect(page).to have_content('ログアウト')
      # ログインしたユーザーのニックネームが表示されていることを確認する
      expect(page).to have_content(@user.nickname)
      # 新規登録ボタンやログインボタンが表示されていないことを確認する
      expect(page).to have_no_content('ログイン')
      expect(page).to have_no_content('新規登録')
    end
  end

  context 'ユーザーがログインできない時' do
    it '保存されているユーザー情報が合致しない場合、ログインできず、エラーメッセージが表示される' do
      # トップページへ移動する
      basic_pass root_path
      # ログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      # ログインページへ遷移する
      visit new_user_session_path
      # 誤ったユーザー情報を入力する
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: ''
      # ログインボタンを押す
      click_on('ログイン')
      # ログインページへ戻されることを確認する
      expect(current_path).to eq user_session_path
      # エラーメッセージが表示されていることを確認する
      expect(page).to have_content('Eメールまたはパスワードが違います')
    end
  end
end
