FactoryBot.define do
  sequence(:email) { |y| "test#{y}@test.com"}

  factory :user, class: User do
    email
    password "password"
    first_name "Adam"
    last_name "Smith"
    admin false
  end

  factory :admin, class: User do
    email
    password "password"
    first_name "Adam"
    last_name "Smith"
    admin true
  end
end
