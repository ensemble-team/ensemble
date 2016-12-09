FactoryGirl.define do
  factory :request do
    owner_id 1
    collab_id 1
    message "Please accept"
    status "In Progress"
    request_owner_id 1
  end
end
