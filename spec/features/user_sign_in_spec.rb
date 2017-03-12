require 'rails_helper'

feature "User sign in" do
  let!(:user) { create(:user, email: "jill@example.com", password: "mypassword") }

  scenario "User can sign in with valid credentials" do
    visit sign_in_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(current_path).to eq root_path
    expect(page).to have_content "You have successfully signed in!"
  end

  scenario "User cannot sign in with invalid credentials" do
    visit sign_in_path

    fill_in 'Email', with: "bad@example.com"
    fill_in 'Password', with: "password"
    click_button 'Sign In'

    expect(current_path).to eq sign_in_path
    expect(page).to have_content "Invalid Email/Password combination"
  end

  scenario "User can sign out" do
    user_sign_in(user)

    visit sign_out_path

    expect(current_path).to eq sign_in_path
    expect(page).to have_content "You have successfully signed out!"
  end
end
