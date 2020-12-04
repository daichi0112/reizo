module EditFoodSupport
  def move_edit_food(food)
    expect(page).to have_link href: edit_food_path(food)
    visit edit_food_path(food)
    expect(
      find('#food_name').value
    ).to eq food.name
    expect(
      find('#food_number').value.to_i
    ).to eq food.number
    expect(
      find('#food_unit_id').find('option[selected]').value.to_i
    ).to eq food.unit_id
    expect(
      find('#food_category_id').find('option[selected]').value.to_i
    ).to eq food.category_id
    expect(
      find('#food_bb_date').value.to_date
    ).to eq food.bb_date
  end
end