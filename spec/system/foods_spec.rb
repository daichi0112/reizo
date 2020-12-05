require 'rails_helper'

def basic_pass(path)
  username = ENV['BASIC_AUTH_USER']
  password = ENV['BASIC_AUTH_PASSWORD']
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe '食材登録', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @food = FactoryBot.build(:food)
  end

  context '食材が登録できる時' do
    it 'ログインしたユーザーは、食材を登録できる' do
      # ログインする
      log_in(@user)
      # 新規食材登録ページへのリンクがあることを確認する
      # 登録ページに移動する
      # セレクトボックスに特定の項目が存在することを確認する(単位)
      # セレクトボックスに特定の項目が存在することを確認する(カテゴリー)
      # フォームに情報を入力する
      new_food(@food)
      # 送信すると、foodモデルのカウントが1上がるのを確認する
      expect do
        click_on('登録する')
      end.to change { Food.count }.by(1)
      # トップページに遷移する
      expect(current_path).to eq root_path
      # トップページに先ほど登録した内容の食材が存在することを確認する(食材名)
      expect(page).to have_content(@food.name)
      # トップページに先ほど登録した内容の食材が存在することを確認する(数量)
      expect(page).to have_content(@food.number)
      # トップページに先ほど登録した内容の食材が存在することを確認する(単位)
      expect(page).to have_content(@food.unit.name)
      # トップページに先ほど登録した内容の食材が存在することを確認する(日付:本日)
      expect(page).to have_content('本日')
    end

    it 'ログインしたユーザーは、食材を登録できる(日付：本日より前)' do
      # ログインする
      log_in(@user)
      # 新規食材登録ページへのリンクがあることを確認する
      # 登録ページに移動する
      # セレクトボックスに特定の項目が存在することを確認する(単位)
      # セレクトボックスに特定の項目が存在することを確認する(カテゴリー)
      # フォームに情報を入力する
      new_food(@food)
      fill_in 'food_bb_date', with: @food.bb_date - 1
      # 送信すると、foodモデルのカウントが1上がるのを確認する
      expect do
        click_on('登録する')
      end.to change { Food.count }.by(1)
      # トップページに遷移する
      expect(current_path).to eq root_path
      # トップページに先ほど登録した内容の食材が存在することを確認する(食材名)
      expect(page).to have_content(@food.name)
      # トップページに先ほど登録した内容の食材が存在することを確認する(数量)
      expect(page).to have_content(@food.number)
      # トップページに先ほど登録した内容の食材が存在することを確認する(単位)
      expect(page).to have_content(@food.unit.name)
      # 賞味期限切れの場合、"賞味期限 切れ" と表示されていることを確認する
      expect(page).to have_content('賞味期限 切れ')
    end

    it 'ログインしたユーザーは、食材を登録できる(日付：本日)' do
      # ログインする
      log_in(@user)
      # 新規食材登録ページへのリンクがあることを確認する
      # 登録ページに移動する
      # セレクトボックスに特定の項目が存在することを確認する(単位)
      # セレクトボックスに特定の項目が存在することを確認する(カテゴリー)
      # フォームに情報を入力する
      new_food(@food)
      # 送信すると、foodモデルのカウントが1上がるのを確認する
      expect do
        click_on('登録する')
      end.to change { Food.count }.by(1)
      # トップページに遷移する
      expect(current_path).to eq root_path
      # トップページに先ほど登録した内容の食材が存在することを確認する(食材名)
      expect(page).to have_content(@food.name)
      # トップページに先ほど登録した内容の食材が存在することを確認する(数量)
      expect(page).to have_content(@food.number)
      # トップページに先ほど登録した内容の食材が存在することを確認する(単位)
      expect(page).to have_content(@food.unit.name)
      # 賞味期限が本日の場合、"賞味期限 本日" と表示されていることを確認する
      expect(page).to have_content('賞味期限 本日')
    end

    it 'ログインしたユーザーは、食材を登録できる(日付：本日より後)' do
      # ログインする
      log_in(@user)
      # 新規食材登録ページへのリンクがあることを確認する
      # 登録ページに移動する
      # セレクトボックスに特定の項目が存在することを確認する(単位)
      # セレクトボックスに特定の項目が存在することを確認する(カテゴリー)
      # フォームに情報を入力する
      new_food(@food)
      fill_in 'food_bb_date', with: @food.bb_date + 1
      # 送信すると、foodモデルのカウントが1上がるのを確認する
      expect do
        click_on('登録する')
      end.to change { Food.count }.by(1)
      # トップページに遷移する
      expect(current_path).to eq root_path
      # トップページに先ほど登録した内容の食材が存在することを確認する(食材名)
      expect(page).to have_content(@food.name)
      # トップページに先ほど登録した内容の食材が存在することを確認する(数量)
      expect(page).to have_content(@food.number)
      # トップページに先ほど登録した内容の食材が存在することを確認する(単位)
      expect(page).to have_content(@food.unit.name)
      # 賞味期限が本日より後の場合、"入力した日付" が表示されていることを確認する
      expect(page).to have_content(@food.bb_date + 1)
    end
  end

  context '食材を登録できない時' do
    it 'ログインしていないと、食材登録ページに遷移できない' do
      # トップページに移動する
      basic_pass root_path
      # 食材登録ページへのボタンがないことを確認する
      expect(page).to have_no_content('食材登録')
    end
  end
end

RSpec.describe '食材編集', type: :system do
  before do
    @food1 = FactoryBot.create(:food)
    @food2 = FactoryBot.create(:food)
  end

  context '食材編集できる時' do
    it 'ログインしたユーザーは、自分が登録した食材を編集できる' do
      # 食材1を登録したユーザーでログインする
      log_in(@food1.user)
      # トップページに食材1編集ページへのリンクがあることを確認する
      # 食材編集ページへ移動する
      # 既に登録済みの内容がフォームに入っていることを確認する
      move_edit_food(@food1)
      # 変更ボタンがあることを確認する
      expect(page).to have_button('変更する')
      # 登録内容を編集する
      fill_in 'food_name', with: "#{@food1.name} + 編集した食材"
      fill_in 'food_number', with: @food1.number + 1
      select 'パック', from: 'food_unit_id'
      select '肉', from: 'food_category_id'
      fill_in 'food_bb_date', with: @food1.bb_date + 1
      # 編集してもfoodモデルのカウントは変わらないことを確認する
      expect do
        click_on('変更する')
      end.to change { Food.count }.by(0)
      # トップページに遷移することを確認する
      expect(current_path).to eq root_path
      # トップページに先ほど編集した内容の食材が存在することを確認する(食材名)
      expect(page).to have_content("#{@food1.name} + 編集した食材")
      # トップページに先ほど編集した内容の食材が存在することを確認する(数量)
      expect(page).to have_content(@food1.number + 1)
      # トップページに先ほど編集した内容の食材が存在することを確認する(単位)
      expect(page).to have_content('パック')
      # トップページに先ほど編集した内容の食材が存在することを確認する(日付)
      expect(page).to have_content(@food1.bb_date + 1)
    end
  end

  context '食材編集できない時' do
    it 'ログインしたユーザーは、自分以外のユーザーが登録した食材が表示されない' do
      # 食材1を登録したユーザーでログインする
      log_in(@food1.user)
      # 食材2の情報が表示されていないことを確認する
      expect(page).to have_no_link href: edit_food_path(@food2)
    end

    it 'ログインしていないと食材編集ページには遷移できない' do
      # トップページにいる
      basic_pass root_path
      # トップページに食材情報の表示がないことを確認する
      expect(page).to have_no_link href: edit_food_path(@food1)
      expect(page).to have_no_link href: edit_food_path(@food2)
    end
  end
end

RSpec.describe '食材削除', type: :system do
  before do
    @food1 = FactoryBot.create(:food)
    @food2 = FactoryBot.create(:food)
  end

  context '食材削除できる時' do
    it 'ログインしたユーザーは、自分が登録した食材を削除できる' do
      # food1を登録したユーザーでログインする
      log_in(@food1.user)
      # トップページに食材1編集ページへのリンクがあることを確認する
      # 食材編集ページへ移動する
      # 既に登録済みの内容がフォームに入っていることを確認する
      move_edit_food(@food1)
      # 削除ボタンがあることを確認する
      expect(page).to have_content('削除する')
      # 食材を削除すると、foodモデルのカウントが1減るのを確認する
      expect do
        click_on('削除する')
      end.to change { Food.count }.by(-1)
      # トップページへ遷移する
      expect(current_path).to eq root_path
      # トップページに削除した食材が存在しないことを確認する
      expect(page).to have_no_link href: edit_food_path(@food1)
    end
  end

  context '食材削除できない時' do
    it 'ログインしたユーザーは、自分以外のユーザーが登録した食材が表示されない' do
      # food1を登録したユーザーでログインする
      log_in(@food1.user)
      # 食材2の情報が表示されていないことを確認する
      expect(page).to have_no_link href: edit_food_path(@food2)
    end
  end
end

RSpec.describe '食材検索', type: :system do
  before do
    @food1 = FactoryBot.create(:food)
    @food2 = FactoryBot.create(:food)
  end

  context '食材検索できる時' do
    it 'ログインしたユーザーは、自分が登録した食材を検索できる' do
      # food1を登録したユーザーでログインする
      log_in(@food1.user)
      # トップページに食材1の情報があることを確認する
      # 検索バーがあることを確認する(キーワード入力欄)
      # 検索バーがあることを確認する(カテゴリー選択欄)
      # 検索バーがあることを確認する(賞味期限入力欄)
      # 検索ボタンがあることを確認する
      # 検索したい食材の情報を入力する
      search_food(@food1)
      # 検索ボタンをクリックする
      find('button[id="search-btn"]').click
      # 検索結果ページに遷移する
      expect(current_path).to eq search_foods_path
      # 検索結果の表示があることを確認する
      expect(page).to have_content('検索結果')
      # 検索した食材が表示されていることを確認する(食材名)
      expect(page).to have_content(@food1.name)
      # 検索した食材が表示されていることを確認する(数量)
      expect(page).to have_content(@food1.number)
      # 検索した食材が表示されていることを確認する(単位)
      expect(page).to have_content(@food1.unit.name)
      # 検索した食材が表示されていることを確認する(日付：本日)
      expect(page).to have_content('本日')
      # 戻るボタンがあることを確認する
      expect(page).to have_content('戻る')
    end

    it '検索した食材が存在しない場合、"一致する食材がありません"と表示されることを確認する' do
      # food1を登録したユーザーでログインする
      log_in(@food1.user)
      # トップページに食材1の情報があることを確認する
      # 検索バーがあることを確認する(キーワード入力欄)
      # 検索バーがあることを確認する(カテゴリー選択欄)
      # 検索バーがあることを確認する(賞味期限入力欄)
      # 検索ボタンがあることを確認する
      # 検索したい食材の情報を入力する
      search_food(@food1)
      fill_in 'q_name_cont', with: "#{@food1.name}+ 一致しない食材"
      # 検索ボタンをクリックする
      find('button[id="search-btn"]').click
      # 検索結果ページに遷移する
      expect(current_path).to eq search_foods_path
      # 検索結果の表示があることを確認する
      expect(page).to have_content('検索結果')
      # 一致する商品がありませんと表示されていることを確認する
      expect(page).to have_content('一致する食材がありません')
      # 戻るボタンがあることを確認する
      expect(page).to have_content('戻る')
    end
  end

  context '食材検索できない時' do
    it 'ログインしたユーザーは、自分以外のユーザーが登録した食材が表示されない' do
      # food1を登録したユーザーでログインする
      log_in(@food1.user)
      # トップページに食材1の情報があることを確認する
      # 検索バーがあることを確認する(キーワード入力欄)
      # 検索バーがあることを確認する(カテゴリー選択欄)
      # 検索バーがあることを確認する(賞味期限入力欄)
      # 検索ボタンがあることを確認する
      # 検索したい食材の情報を入力する
      search_food(@food1)
      # 検索ボタンをクリックする
      find('button[id="search-btn"]').click
      # 検索結果ページに遷移する
      expect(current_path).to eq search_foods_path
      # 検索結果の表示があることを確認する
      expect(page).to have_content('検索結果')
      # food2の食材が表示されないことを確認する
      expect(page).to have_no_link href: edit_food_path(@food2)
      # 戻るボタンがあることを確認する
      expect(page).to have_content('戻る')
    end

    it 'ログインしていないユーザーは、検索ボタンを押すとログインページへ遷移する' do
      # トップページにいる
      basic_pass root_path
      # トップページに食材情報の表示がないことを確認する
      expect(page).to have_no_link href: edit_food_path(@food1)
      expect(page).to have_no_link href: edit_food_path(@food2)
      # 検索ボタンをクリックする
      find('button[id="search-btn"]').click
      # ログインページへ遷移する
      expect(current_path).to eq new_user_session_path
    end
  end
end
