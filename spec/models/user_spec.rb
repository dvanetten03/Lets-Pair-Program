require 'rails_helper'

RSpec.describe User, type: :model do

  it "should not have duplicate email addresses" do
    @user = FactoryGirl.create(:user)
    duplicate_user_email = @user.email.upcase # FAKENAME13@gmail.com
    @duplicateUser = FactoryGirl.build(:user, email: duplicate_user_email)
    @duplicateUser.save
    # there's probably a better way to write this line below.
    expect(@duplicateUser.invalid?).to eq(true)
  end
  
end
