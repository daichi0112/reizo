module NewFoodSupport
  def new_food(food_name, food_number, food_bb_date)
    expect(page).to have_content('食材登録')
    visit new_food_path
    expect(page).to have_select('food_unit_id', options: ['--', '個', 'パック', '袋', 'g', '尾', '切れ', '玉', '枚'])
    expect(page).to have_select(
      'food_category_id',
      options: ['--', '野菜', '肉', '魚介', '米・パン・麺類', '卵・チーズ・乳製品', '飲料', '調味料', '粉類', '乾物', '豆腐・納豆・漬物', '惣菜・レトルト・冷凍', '果物', 'その他']
    )
    fill_in 'food_name', with: food_name
    fill_in 'food_number', with: food_number
    select '個', from: 'food_unit_id'
    select '野菜', from: 'food_category_id'
    fill_in 'food_bb_date', with: food_bb_date
  end
end
