FactoryGirl.define do
  factory :comment do
    body "MyText"
    comment_owner_id 1
    comment_owner_type "MyString"
  end
end
