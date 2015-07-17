require 'rails_helper'

RSpec.describe User, :type => :model do
  


  context "email" do

  	it "must be present" do
  		expect(FactoryGirl.build(:null_email).save).to be false
  	end

  	it "must be unique in the system" do
  		#create a valid user and save in the database
  		valid_user = FactoryGirl.create :valid_user

  		#attempt to create another user with the same email
  		#in this case save should reutrn false as this is a duplicate email
  		expect(FactoryGirl.build(:valid_user).save).to be false
  	end

  	it "must have less than 50 characters" do
  		expect(FactoryGirl.build(:long_email).save).to be false
  	end

  	it "must be valid" do
  		expect(FactoryGirl.build(:invalid_email).save).to be false
  	end

  end

  context "password" do

  	it "must have more than 6 characters" do
  		expect(FactoryGirl.build(:user_no_password).save).to be false
  	end	

  	it "must have less than 30 characters" do
  		expect(FactoryGirl.build(:long_password).save).to be false
  	end

  	it "must have a matching password confirmation" do
  		expect(FactoryGirl.build(:confirm_password).save).to be false
  	end
  end
end
