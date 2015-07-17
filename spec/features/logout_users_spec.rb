require 'rails_helper'

RSpec.describe "Logout", :type => :feature do
  describe "logout a user" do
    it "logs out a user and redirects to users path" do
      user = FactoryGirl.create(:valid_user)

      visit new_session_path
      fill_in "Email", with: "test@test.com"
      fill_in "Password", with: "password"
      click_on "Log In"

      click_on "Logout"
      expect(current_path).to eq(users_path)
    end
  end
end