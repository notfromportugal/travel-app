require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
	#render_views

	it "should return index view for index method" do

    	get :index

    	expect(response).to render_template(:index)
    end

  	it "new creates a new user" do
    	get :new

    	expect(assigns(:user)).to be_a_new(User)
    end

    it "should return new view for new method" do

    	get :new

    	expect(response).to render_template(:new)
    end

    it "should redirect after new user" do
    	post :create, user: FactoryGirl.attributes_for(:valid_user)

    	expect(response).to redirect_to(new_session_path)
    end

    it "should redirect when invalid" do
    	post :create, user: FactoryGirl.attributes_for(:null_email)

    	expect(response).to redirect_to(new_user_path)
    end
end

