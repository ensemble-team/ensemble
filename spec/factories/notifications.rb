FactoryGirl.define do
  factory :notification do
    notification_owner_type "MyString"
    notification_owner_id 1
    notified_by 1
    read false
    user nil
  end
end
