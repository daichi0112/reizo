module LogInSupport
  def log_in(user)
    basic_pass root_path
    expect(page).to have_content('ログイン')
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on('ログイン')
    expect(current_path).to eq root_path
  end
end