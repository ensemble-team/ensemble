FactoryGirl.define do
  factory :message do
    recipient 2
    sender 1
    body "MyText"
    user_id 1
  end
end
