require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do


	it "should render the new template" do

    	get :new

    	expect(response).to render_template(:new)
    end

    it "should assign new user for the login form" do

    	get :new

    	expect(assigns(:user)).to be_a_new(User)
    end

    it "should login user with correct user name and password" do
        user = FactoryGirl.create(:valid_user) 
    	post :create, user: FactoryGirl.attributes_for(:valid_user)

    	expect(response).to redirect_to(user_letters_path(user))

	end

	it "should not login user with incorrect user name and password" do
		user = FactoryGirl.create(:no_match) 
        post :create, user: FactoryGirl.attributes_for(:valid_user)

		expect(response).to redirect_to(new_session_path)
	end

    it "should destroy the session when logging a user out" do
        get :destroy

        expect(session[:user_id]).to be nil 
    end

    it "should redirect to users page when logging a user out" do
        get :destroy

        expect(response).to redirect_to(users_path)
    end

end

 