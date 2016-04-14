FactoryGirl.define do
  factory :post do
    user
    section
    title "Test Post"
    message "Hi everyone!"
  end
end
