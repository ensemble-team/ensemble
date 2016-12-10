FactoryGirl.define do
  factory :message do
    project 1
    branch 1
    recipient 1
    sender 1
    body "MyText"
    user nil
  end
end
