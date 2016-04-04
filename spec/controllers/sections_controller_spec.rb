require 'rails_helper'

RSpec.describe SectionsController, type: :controller do
  describe "sections#new action" do
    it "should require users to be logged in" do
      test_category = Category.create(name: "test", description: "test")
      get :new, :category_id => test_category
      expect(response).to redirect_to new_user_session_path
    end

    it "should successfully show the new form" do
      test_category = Category.create(name: "test", description: "test")
      user = User.create(
        email:                 'fakeuser@gmail.com',
        password:              'secretPassword',
        password_confirmation: 'secretPassword'
      )
      sign_in user

      get :new, :category_id => test_category
      expect(response).to have_http_status(:success)
    end
  end

  describe "sections#create action" do
    it "should require users to be logged in" do
      test_category = Category.create(name: "test", description: "test")
      post :create, :category_id => test_category, section: {name: "Intros", description: "A place for intros"}
      expect(response).to redirect_to new_user_session_path
    end

    it "should successfully create a section in the database" do
      test_category = Category.create(name: "test", description: "test")
      user = User.create(
        email:                 'fakeuser@gmail.com',
        password:              'secretPassword',
        password_confirmation: 'secretPassword'
      )
      sign_in user
      
      post :create, :category_id => test_category, section: {name: 'Intros', description: "A place for intros"}
      expect(response).to redirect_to root_path

      section = Section.last
      expect(section.name).to eq("Intros")
      expect(section.description).to eq("A place for intros")
      expect(section.category).to eq(test_category)
    end

    it "should not allow a blank name" do
      test_category = Category.create(name: "test", description: "test")

      user = User.create(
        email:                 'fakeuser@gmail.com',
        password:              'secretPassword',
        password_confirmation: 'secretPassword'
      )
      sign_in user

      section_pre_count = Section.count
      post :create, :category_id => test_category, section: {name: '', description: "A place for intros"}
      expect(response).to have_http_status(:unprocessable_entity)
      expect(section_pre_count).to eq Section.count
    end
  end
end
