FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test-#{n.to_s.rjust(3, "0")}@sample.com" }
    username { "ryan21" }
    first_name { "Ryan" }
    password { "Abcd123!" }
  end
end
