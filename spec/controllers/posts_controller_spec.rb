require 'rails_helper'

RSpec.describe PostsController, type: :controller do
	describe "posts#index action" do
    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)
    end
	end

  describe "posts#new action" do
    it "should succesfully show the new post form" do
      user = FactoryGirl.create(:user)
      sign_in user

      section = FactoryGirl.create(:section)
      get :new, :section_id => section
      expect(response).to have_http_status(:success)
    end

    it "should require users to be logged in" do
      section = FactoryGirl.create(:section)
      get :new, :section_id => section
      expect(response).to redirect_to new_user_session_path
    end

    it "should redirect to posts#index if the section is invalid" do
      user = FactoryGirl.create(:user)
      sign_in user
      
      get :new, :section_id => "not a real section id"
      expect(response).to redirect_to posts_path
    end

  end

  
end
