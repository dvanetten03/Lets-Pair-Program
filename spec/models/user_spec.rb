require 'rails_helper'

RSpec.describe User, type: :model do
  @user = FactoryGirl.create(:user)

  it "should not have duplicate email addresses" do
      duplicate_user_email = @user.email.upcase
      @user.save
      assert_not duplicate_user_email.valid?
    end
  
end
