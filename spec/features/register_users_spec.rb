require 'rails_helper'

RSpec.describe "Register", :type => :feature do
  describe "Register a new user" do
    it "Registers a new user and redirect to login" do
     
      visit new_user_path
      fill_in "Email", with: "test@test.com"
      fill_in "Password", with: "password"
      fill_in "Password Confirmation", with: "password"
      click_on "Signup"
      expect(current_path).to eq(new_session_path)

      
    end
  end
end