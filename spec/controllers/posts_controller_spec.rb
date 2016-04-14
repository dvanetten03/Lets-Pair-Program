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
      get :new
      expect(response).to redirect_to new_user_session_path
    end

  end

end
