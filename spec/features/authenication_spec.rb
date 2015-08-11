require "rails_helper"

describe "Authentication", js: true do

  let!(:user) { create :user }

  scenario "Logging in a user" do
    visit new_session_path
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password

    click_button 'Submit'
    within ".welcome" do
      expect(page).to have_content "Welcome #{user.email}"
    end
  end

  scenario "Invalid email or password" do
    visit new_session_path
    fill_in 'email', with: "lalalal@example.com"
    fill_in 'password', with: "lalalala"

    click_button 'Submit'
    within ".alert-error" do
      expect(page).to have_content "Invalid email or password"
    end
  end

  scenario "Log Outs user" do
    visit new_session_path
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password

    click_button 'Submit'
    click_link "Log Out"

    within ".alert-success" do
      expect(page).to have_content "Sign Out user"
    end
  end

end
