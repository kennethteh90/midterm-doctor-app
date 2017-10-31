FactoryBot.define do
  factory :doctor do
    sequence :username { |n| "user#{n}" }
    gender 'male'
    address 'somewhere'
  end
end
