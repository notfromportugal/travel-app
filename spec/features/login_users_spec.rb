require 'rails_helper'

RSpec.describe "Login", :type => :feature do
  describe "loggin a user in" do
    it "logs in a user and redirects to users path" do
      user = FactoryGirl.create(:valid_user)

      visit new_session_path
      fill_in "Email", with: "test@test.com"
      fill_in "Password", with: "password"
      click_on "Log In"
      expect(current_path).to eq(user_letters_path(user))
    end
  end
end