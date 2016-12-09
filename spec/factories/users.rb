FactoryGirl.define do
  factory :user do
    email "test@test.com"
    password "password"
    password_confirmation "password"
  end


  # factory :admin, class: User do
  #   email "admin@test.com"
  #   password "adminpassword"
  #   password_confirmation "adminpassword"
  # end
end
