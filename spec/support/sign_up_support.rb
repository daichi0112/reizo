module SignUpSupport
  def sign_up
    basic_pass root_path
    expect(page).to have_content('新規登録')
    visit new_user_registration_path
  end
end
