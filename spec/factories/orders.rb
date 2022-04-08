FactoryBot.define do
  factory :order do
    prefecture_id { '38' }
    association :user
    association :profile
    association :video
  end
end
