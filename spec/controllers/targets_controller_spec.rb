require 'rails_helper'

RSpec.describe TargetsController, :type => :controller do

	it "should render login page when user is not logged in or authorized" do
		get :index 

		expect(response).to redirect_to(new_session_path)

	end

	it "should render index page when user is logged in" do
		allow(controller).to receive(:authorize).and_return(FactoryGirl.build(:valid_user))

		get :index

		expect(response).to render_template(:index)

	end


end


