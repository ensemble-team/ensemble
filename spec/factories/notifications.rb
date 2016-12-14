FactoryGirl.define do
  factory :notification do
    owner_type "MyString"
    owner_id 1
    notified_by 1
    read false
    user_id 1
  end
end
