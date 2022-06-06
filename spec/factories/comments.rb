FactoryBot.define do
  factory :comment do
    value   { '4.5' }
    text    { '最高です!' }
    association :user
    association :profile
    association :video
  end
end
