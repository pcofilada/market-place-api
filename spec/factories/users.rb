FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    password "qwerty123456"
    password_confirmation "qwerty123456"
  end
end
