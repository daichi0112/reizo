module SearchFoodSupport
  def search_food(food)
    expect(page).to have_link href: edit_food_path(food)
    expect(page).to have_field('q_name_cont')
    expect(page).to have_select('q_category_id_eq')
    expect(page).to have_field('q_bb_date_gteq')
    expect(page).to have_button('search-btn')
    fill_in 'q_name_cont', with: food.name
    find('#q_category_id_eq').find("option[value='#{food.category_id}']").select_option
    fill_in 'q_bb_date_gteq', with: food.bb_date
  end
end
