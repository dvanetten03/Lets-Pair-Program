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

  describe "posts#create action" do
    it "should require users to be logged in" do
      section = FactoryGirl.create(:section)
      post :create, :section_id => section, post: {title: "Test Post", message: "Hello hello"}
      expect(response).to redirect_to new_user_session_path
    end

    it "should redirect to posts#index if the section is invalid" do
      user = FactoryGirl.create(:user)
      sign_in user

      post :create, :section_id => "not a real session id", post: {title: "Test Post", message: "Hello hello"}
      expect(response).to redirect_to posts_path
    end

    it "should successfully create a post" do
      section = FactoryGirl.create(:section)
      user = FactoryGirl.create(:user)
      sign_in user

      post :create, :section_id => section, post: {title: "Test Post", message: "Hello hello"}

      expect(response).to redirect_to posts_path

      post = section.posts.last
      expect(post.title).to eq("Test Post")
      expect(post.message).to eq("Hello hello")
    end
  end

  describe "posts#show action" do
    it "should successfully show the page" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

end
